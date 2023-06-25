module counter
#(
parameter CNT_MAX = 25'd24_999_999/*这是我们第一次使用参数的方式定义常量
使用参数的方式定义常量有很多好处，如：我们在RTL代码中实例化该模块时，如果需要两个
不同计数值的计数器我们不必设计两个模块，而是直接修改参数的值即可；另一个好处是在编
写Testbench进行仿真时我们也需要实例化该模块，但是我们需要仿真至少0.5s的时间才
能够看出到led_out效果，这会让仿真时间很长，也会导致产生的仿真文件很大，所以我们
可以通过直接修改参数的方式来缩短仿真的时间而看到相同的效果，且不会影响到RTL代码模
块中的实际值，因为parameter定义的是局部参数，所以只在本模块中有效。为了更好的区
 分，参数名我们习惯上都要大写*/
 )
 (
 input wire sys_clk , //系统时钟50MHz
 input wire sys_rst_n , //全局复位

 output reg led_out //输出控制led灯
 );

 reg [24:0] cnt; //经计算得需要25位宽的寄存器才够500ms

 //cnt:计数器计数，当计数到CNT_MAX的值时清零
 always@(posedge sys_clk or negedge sys_rst_n)
 if(sys_rst_n == 1'b0)
 cnt <= 25'b0;
 else if(cnt == CNT_MAX)
 cnt <= 25'b0;
 else
 cnt <= cnt + 1'b1;

 //led_out:输出控制一个LED灯，每当计数满标志信号有效时取反
 always@(posedge sys_clk or negedge sys_rst_n)
 if(sys_rst_n == 1'b0)
 led_out <= 1'b0;
 else if(cnt == CNT_MAX)
 led_out <= ~led_out;

 endmodule