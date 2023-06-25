module mux2_1
(
input wire in1, //输入端1
input wire in2, //输入端2
input wire sel, //选择端

output wire out //结果输出
);

 //out:组合逻辑输出选择结果
 //此处使用的是条件运算符（三元运算符），当括号里面的条件成立时
 //执行"?”后面的结果；如果括号里面的条件不成立时，执行“：”后面的结果
assign out = (sel == 1'b1) ? in1 : in2 ;

endmodule