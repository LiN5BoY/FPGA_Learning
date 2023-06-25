`timescale 1ns/1ns
module tb_divider_six();

reg sys_clk;
reg sys_rst_n;

wire clk_out;

//初始化系统时钟，全局复位
initial begin
sys_clk = 1'b1;
sys_rst_n <= 1'b0;
#20
sys_rst_n <= 1'b1;
end

//sys_clk:模拟系统时钟，每10ns电平翻转一次，周期为20ns，频率为50MHz
always #10 sys_clk = ~sys_clk;

//--------------------divider_sixht_inst--------------------
divider_six divider_six_inst
(
.sys_clk (sys_clk ), //input sys_clk
.sys_rst_n (sys_rst_n ), //input sys_rst_n

.clk_out (clk_out ) //output clk_out

);

endmodule