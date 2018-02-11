
module mcp (clk, reset,start,din,win,ready,out);
	parameter width = 4;
	parameter l1 = 4;
	parameter l2 = 3;
	parameter l3 = 5;
	parameter l4 = 0;
	parameter l5 = 0;
	parameter total = l1+l2+l3+l4+l5;
	input [l1*width-1:0] din;
	input clk,start;						// System Clock
	input reset;					// System Reset
	input [(l1*l2+l2*l3+l4*l5)*width-1:0] win;
	wire [width-1:0] core_dataOut[total-1:0];	// Write Data to DMEM of core 1
	wire [0:31] core1_memAddr[total-1:0];	// Write Address for DMEM of core 1
	reg [3:0] sel1,sel2,sel3,sel4,sel5;
	output reg[width-1:0] out;
	output reg ready;
	reg [width-1:0] o1,o2,o3,o4,o5;
	reg [2:0] mode[3:0];
	reg [width-1:0] w[total-1:0];
	reg [3:0] state,counter;
	integer wc;
	// Your Code
	integer a,b,c;
	genvar i;
	generate
		for (i=0; i<l1; i=i+1) begin :l1_processor
			assign core_dataOut[i]=din[(i+1)*width-1-:width];
		end
		for (i=l1; i<l1+l2; i=i+1) begin :l2_processor
			neuron #(width) n(clk,reset,mode[0],o1,w[i],core_dataOut[i]);
		end
		for (i=l1+l2; i<l1+l2+l3; i=i+1) begin :l3_processor
			neuron #(width) n(clk,reset,mode[1],o2,w[i],core_dataOut[i]);
		end
		for (i=l1+l2+l3; i<l1+l2+l3+l4; i=i+1) begin :l4_processor
			neuron #(width) n(clk,reset,mode[2],o3,w[i],core_dataOut[i]);
		end
		for (i=l1+l2+l3+l4; i<total; i=i+1) begin :l5_processor
			neuron #(width) n(clk,reset,mode[3],o4,w[i],core_dataOut[i]);
		end
	endgenerate
		always@(core_dataOut,sel1,sel2,sel3,sel4,sel5) begin
			if(l1>0) o1<=core_dataOut[sel1];
			if(l2>0) o2<=core_dataOut[l1+sel2];
			if(l3>0) o3<=core_dataOut[l1+l2+sel3];
			if(l4>0) o4<=core_dataOut[l1+l2+l3+sel4];
		end
		always @ ( negedge clk ) begin
			if(reset) begin state<=0; counter<=0; mode[0]<=0;mode[1]<=0;mode[2]<=0;mode[3]<=0;wc<=0;
			sel1=0;sel2=0;sel3=0;sel4=0;sel5=0; ready=0;end
			else begin
				case (state)
				0: if(start) begin state<=1; sel1=0; end
				1: begin
					if(counter<l1&&l2>0)begin
						mode[0]<=1;
						for(c=l1;c<l1+l2;c=c+1) begin
							w[c]<=win[(wc+1)*width-1-:width];
							wc=wc+1;
						end
						sel1<=sel1+1;
						counter<=counter+1;
					end
					else if(counter<l1&&l2==0)begin
						ready<=1;
						sel1<=sel1+1;
						counter<=counter+1;
						out<=o1;
					end
					else if(counter==l1)begin mode[0]<=2; counter<=counter+1;end
					else begin mode[0]<=0; state=2;counter<=0;end
				end
				2: begin
					if(counter<l2&&l3>0)begin
						mode[1]<=1;
						for(c=l1+l2;c<l1+l2+l3;c=c+1) begin
							w[c]<=win[(wc+1)*width-1-:width];
							wc=wc+1;
						end
						sel2<=sel2+1;
						counter<=counter+1;
					end
					else if(counter<l2&&l3==0)begin
						ready<=1;
						sel2<=sel2+1;
						counter<=counter+1;
						out<=o2;
					end
					else if(counter==l2)begin mode[1]<=2; counter<=counter+1;end
					else begin mode[1]<=0; state=3;counter<=0;end
				end

				3: begin
					if(counter<l3&&l4>0)begin
						mode[2]<=1;
						for(c=l1+l2+l3;c<l1+l2+l3+l4;c=c+1) begin
							w[c]<=win[(wc+1)*width-1-:width];
							wc=wc+1;
						end
						sel3<=sel3+1;
						counter<=counter+1;
					end
					else if(counter<l3&&l4==0)begin
						ready<=1;
						sel3<=sel3+1;
						counter<=counter+1;
						out<=o3;
					end
					else if(counter==l3)begin mode[2]<=2; counter<=counter+1;end
					else begin mode[2]<=0; state=4;counter<=0;end
				end
				4: begin
					if(counter<l4&&l5>0)begin
						mode[3]<=1;
						for(c=l1+l2+l3+l4;c<l1+l2+l3+l4+l5;c=c+1) begin
							w[c]<=win[(wc+1)*width-1-:width];
							wc=wc+1;
						end
						sel4<=sel4+1;
						counter<=counter+1;
					end
					else if(counter<l4&&l5==0)begin
						ready<=1;
						sel4<=sel4+1;
						counter<=counter+1;
						out<=o4;
					end
					else if(counter==l4)begin mode[3]<=2;counter<=counter+1;end
					else begin mode[3]<=0; state=5;counter<=0;end
				end
				5: if(counter<l5)begin
					ready<=1;
					sel5<=sel5+1;
					counter<=counter+1;
					out<=o5;
				end
				default:state<=state;
				endcase
			end
		end

	// processor core1 (.clk(clk),
	// 				 .reset(reset),
	// 				 .pc(core1_pc),
	// 				 .instruction(core1_instruction),
	// 				 .memAddr(core1_memAddr),
	// 				 .memEn(core1_memEn),
	// 				 .memWrEn(core1_memWrEn),
	// 				 .dataIn(core1_dataIn),
	// 				 .dataOut(core1_dataOut));
	//
	//
	//
	// processor core2 (.clk(clk),
	// 				 .reset(reset),
	// 				 .pc(core2_pc),
	// 				 .instruction(core2_instruction),
	// 				 .memAddr(core2_memAddr),
	// 				 .memEn(core2_memEn),
	// 				 .memWrEn(core2_memWrEn),
	// 				 .dataIn(core2_dataIn),
	// 				 .dataOut(core2_dataOut));
	//
	// dispatcher dispatcher (.core1_pc(core1_pc),
	// 					   .core2_pc(core2_pc),
	// 					   .core1_insAddr(core1_insAddr),
	// 					   .core2_insAddr(core2_insAddr));

endmodule