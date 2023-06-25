module flip_flop
(
input wire sys_clk , //系统时钟50Mh
input wire sys_rst_n , //全局复位
input wire key_in , //输入按键

output reg led_out //输出控制led灯
);

//led_out:led灯输出的结果为key_in按键的输入值
//当always块中的敏感列表为检测到sys_clk上升沿或sys_rst_n下降沿时执行下面的语句
always@(posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n == 1'b0)//sys_rst_n为低电平时复位，且是检测到sys_rst_n的下
//降沿时立刻复位，不需等待sys_clk的上升沿来到后再复位
led_out <= 1'b0;
else
led_out <= key_in;

endmodule