`timescale 1ns/1ns

module tb_led();

////
//\* Parameter and Internal Signal \//
////
//wire difne
wire led_out ;
//reg define
reg key_in ;


////
//\* Main Code \//
////
//初始化输入信号
initial key_in <= 1'b0;

//key_in:产生输入随机数,模拟按键的输入情况
always #10 key_in <= {$random} % 2;/* 取模求余数，产生非负随机数0、1
每隔10ns产生一次随机数*/

////
//\* Instantiate \//
////
//------------- led_inst -------------
led_project led_inst
(
.key_in( key_in ), // input key_in

.led_out( led_out ) // output ledout
);

endmodule