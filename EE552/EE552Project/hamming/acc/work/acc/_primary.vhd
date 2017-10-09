library verilog;
use verilog.vl_types.all;
entity acc is
    port(
        \A_e[0]\        : out    vl_logic;
        \A_e[10]\       : out    vl_logic;
        \A_e[11]\       : out    vl_logic;
        \A_e[12]\       : out    vl_logic;
        \A_e[13]\       : out    vl_logic;
        \A_e[14]\       : out    vl_logic;
        \A_e[15]\       : out    vl_logic;
        \A_e[1]\        : out    vl_logic;
        \A_e[2]\        : out    vl_logic;
        \A_e[3]\        : out    vl_logic;
        \A_e[4]\        : out    vl_logic;
        \A_e[5]\        : out    vl_logic;
        \A_e[6]\        : out    vl_logic;
        \A_e[7]\        : out    vl_logic;
        \A_e[8]\        : out    vl_logic;
        \A_e[9]\        : out    vl_logic;
        \Sum_d[0][0]\   : out    vl_logic;
        \Sum_d[0][10]\  : out    vl_logic;
        \Sum_d[0][11]\  : out    vl_logic;
        \Sum_d[0][12]\  : out    vl_logic;
        \Sum_d[0][13]\  : out    vl_logic;
        \Sum_d[0][14]\  : out    vl_logic;
        \Sum_d[0][15]\  : out    vl_logic;
        \Sum_d[0][1]\   : out    vl_logic;
        \Sum_d[0][2]\   : out    vl_logic;
        \Sum_d[0][3]\   : out    vl_logic;
        \Sum_d[0][4]\   : out    vl_logic;
        \Sum_d[0][5]\   : out    vl_logic;
        \Sum_d[0][6]\   : out    vl_logic;
        \Sum_d[0][7]\   : out    vl_logic;
        \Sum_d[0][8]\   : out    vl_logic;
        \Sum_d[0][9]\   : out    vl_logic;
        \Sum_d[1][0]\   : out    vl_logic;
        \Sum_d[1][10]\  : out    vl_logic;
        \Sum_d[1][11]\  : out    vl_logic;
        \Sum_d[1][12]\  : out    vl_logic;
        \Sum_d[1][13]\  : out    vl_logic;
        \Sum_d[1][14]\  : out    vl_logic;
        \Sum_d[1][15]\  : out    vl_logic;
        \Sum_d[1][1]\   : out    vl_logic;
        \Sum_d[1][2]\   : out    vl_logic;
        \Sum_d[1][3]\   : out    vl_logic;
        \Sum_d[1][4]\   : out    vl_logic;
        \Sum_d[1][5]\   : out    vl_logic;
        \Sum_d[1][6]\   : out    vl_logic;
        \Sum_d[1][7]\   : out    vl_logic;
        \Sum_d[1][8]\   : out    vl_logic;
        \Sum_d[1][9]\   : out    vl_logic;
        \A_d[0][0]\     : in     vl_logic;
        \A_d[0][10]\    : in     vl_logic;
        \A_d[0][11]\    : in     vl_logic;
        \A_d[0][12]\    : in     vl_logic;
        \A_d[0][13]\    : in     vl_logic;
        \A_d[0][14]\    : in     vl_logic;
        \A_d[0][15]\    : in     vl_logic;
        \A_d[0][1]\     : in     vl_logic;
        \A_d[0][2]\     : in     vl_logic;
        \A_d[0][3]\     : in     vl_logic;
        \A_d[0][4]\     : in     vl_logic;
        \A_d[0][5]\     : in     vl_logic;
        \A_d[0][6]\     : in     vl_logic;
        \A_d[0][7]\     : in     vl_logic;
        \A_d[0][8]\     : in     vl_logic;
        \A_d[0][9]\     : in     vl_logic;
        \A_d[1][0]\     : in     vl_logic;
        \A_d[1][10]\    : in     vl_logic;
        \A_d[1][11]\    : in     vl_logic;
        \A_d[1][12]\    : in     vl_logic;
        \A_d[1][13]\    : in     vl_logic;
        \A_d[1][14]\    : in     vl_logic;
        \A_d[1][15]\    : in     vl_logic;
        \A_d[1][1]\     : in     vl_logic;
        \A_d[1][2]\     : in     vl_logic;
        \A_d[1][3]\     : in     vl_logic;
        \A_d[1][4]\     : in     vl_logic;
        \A_d[1][5]\     : in     vl_logic;
        \A_d[1][6]\     : in     vl_logic;
        \A_d[1][7]\     : in     vl_logic;
        \A_d[1][8]\     : in     vl_logic;
        \A_d[1][9]\     : in     vl_logic;
        \Sum_e[0]\      : in     vl_logic;
        \Sum_e[10]\     : in     vl_logic;
        \Sum_e[11]\     : in     vl_logic;
        \Sum_e[12]\     : in     vl_logic;
        \Sum_e[13]\     : in     vl_logic;
        \Sum_e[14]\     : in     vl_logic;
        \Sum_e[15]\     : in     vl_logic;
        \Sum_e[1]\      : in     vl_logic;
        \Sum_e[2]\      : in     vl_logic;
        \Sum_e[3]\      : in     vl_logic;
        \Sum_e[4]\      : in     vl_logic;
        \Sum_e[5]\      : in     vl_logic;
        \Sum_e[6]\      : in     vl_logic;
        \Sum_e[7]\      : in     vl_logic;
        \Sum_e[8]\      : in     vl_logic;
        \Sum_e[9]\      : in     vl_logic;
        \_RESET\        : in     vl_logic
    );
end acc;
