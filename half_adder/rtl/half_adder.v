module half_adder
(
input wire in1 ,//加数1
input wire in2 ,//加数2

output wire sum , //两个数的和
output wire cout //两个数加和后的进位

);


assign {cout,sum} = in1 + in2;

endmodule