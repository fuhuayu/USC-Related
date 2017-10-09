M=readtable('dram.txt');
rtl=reshape(M.rtl,[11,16]);
avg_current=reshape(M.avg_current,[11,16]);
avg_power=reshape(M.avg_power,[11,16]);
surf(1:16,M.S(1:11),rtl);
zlabel('R.T.L.');
xlabel('Multiplier');
ylabel('C');
figure;
surf(1:16,M.S(1:11),avg_current);
zlabel('avg_current');
xlabel('Multiplier');
ylabel('C');
figure;
surf(1:16,M.S(1:11),avg_power);
zlabel('avg_power');
xlabel('Multiplier');
ylabel('C');