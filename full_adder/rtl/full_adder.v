module full_adder
(
    input wire in1 , //加数1
    input wire in2 , //加数2
    input wire cin , //上一级的进位

    output wire sum , //两个数的加和
    output wire cout //加和后的进位
);


//wire define
//在顶层中作为half_adder_inst0的sum信号和half_adder_inst1的in1信号的中间连线
wire h0_sum;

//在顶层中作为half_adder_inst0的cout信号和或门的中间连线
wire h0_cout;

//在顶层中作为half_adder_inst1的cout信号和或门的中间连线
wire h1_cout;

//------------------------half_adder_inst0------------------------
half_adder half_adder_inst0//前面是实例化（调用）的模块的名字相当于是
 //告诉顶层我要使用来自half_adder这个模块的功能
 //后面的是在顶层中重新起的在本模块中的名字相当
 //于是这个模块具体到顶层中
 (
    .in1 (in1 ),//input in1 前面in1是相当于half_adder模块中的信号
 //（in1）顶层中的信号，然后最前面加上“.”，可以形象的
 //理解为把这两个信号线连接到一起（rtl中的实例化过程和
 //Testbench中的实例化过程是一样的，可以对比理解学习）
 
    .in2 (in2 ),//input in2
    
    .sum (h0_sum ),//output sum
    
    .cout (ho_cout) //output cout
);

//------------------------half_adder_inst1------------------------
half_adder half_adder_inst1//同一个模块可以被实例化多次（所以相同功能只设计
 //一个通用模块即可），但是在顶层的名字一定要区别开，
 //这样子才能表达出是实例化的两个相同功能的模块
 (
    .in1 (h0_sum ),//input in1
    .in2 (cin ),//input in2
    
    .sum (sum ),//output sum
    .cout (h1_cout) //output cout
);

//cout:总的进位信号
assign cout = ho_cout | h1_cout;

endmodule