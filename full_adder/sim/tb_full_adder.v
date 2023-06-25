module tb_full_adder();

reg in1;
reg in2;
reg cin;

wire sum;
wire cout;


//初始化输入信号
initial begin
in1 <= 1'b0;
in2 <= 1'b0;
cin <= 1'b0;
end

//in1:产生输入随机数，模拟加数1的输入情况
//取模求余数，产生随机数1'b0、1'b1，每隔10ns产生一次随机数
always #10 in1 <= {$random} % 2;

//in2:产生输入随机数，模拟加数2的输入情况
always #10 in2 <= {$random} % 2;

//cin:产生输入随机数，模拟前级进位的输入情况
always #10 cin <= {$random} % 2;

//------------------------------------------------------------
initial begin
$timeformat(-9, 0, "ns", 6);
$monitor("@time %t:in1=%b in2=%b cin=%b sum=%b cout=%b",
$time,in1,in2,cin,sum,cout);
end
//------------------------------------------------------------

//---------------full_adder_inst------------------
full_adder full_adder_inst(
    .in1 (in1 ), //input in1
    .in2 (in2 ), //input in2
    .cin (cin ), //input cin

    .sum (sum ), //output sum
    .cout (cout ) //output cout
);

endmodule