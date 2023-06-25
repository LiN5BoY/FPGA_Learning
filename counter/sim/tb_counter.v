`timescale 1ns/1ns
module tb_counter();

//reg define
reg sys_clk;
reg sys_rst_n;

//wire define
wire led_out;

 //初始化输入信号
 initial begin
 sys_clk = 1'b1;
 sys_rst_n <= 1'b0;
 #20
 sys_rst_n <= 1'b1;
 end

 //sys_clk:每10ns电平翻转一次，产生一个50MHz的时钟信号
 always #10 sys_clk = ~sys_clk;

 //---------------------flip_flop_inst----------------------
 counter
 #(
 .CNT_MAX (25'd24) //实例化带参数的模块时要注意格式，当我们想要修改常数在
 //当前模块的值时，直接在实例化参数名后面的括号内修改即可
 )
 counter_inst(
 .sys_clk (sys_clk ), //input sys_clk
 .sys_rst_n (sys_rst_n ), //input sys_rst_n

 .led_out (led_out ) //output led_out
 );

 endmodule