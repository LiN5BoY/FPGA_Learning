module divider_six
(
input wire sys_clk , //系统时钟50MHz
input wire sys_rst_n , //全局复位

output reg clk_flag //指示系统时钟6分频后的脉冲标志信号

);

reg [2:0] cnt; //用于计数的寄存器

//cnt:计数器从0到5循环计数
always@(posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n == 1'b0)
cnt <= 3'b0;
else if(cnt == 3'd5)
cnt <= 3'b0;
else
cnt <= cnt + 1'b1;

//clk_flag:脉冲信号指示6分频
always@(posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n == 1'b0)
clk_flag <= 1'b0;
else if(cnt == 3'd4)
clk_flag <= 1'b1;
else
clk_flag <= 1'b0;

endmodule