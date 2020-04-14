module bit6_test();
wire [7:0] out;
reg [5:0] num;
integer i;

bit6_BCD bit6_tester(.Bin(num), .Bout(out));

initial  begin
for (i=0; i<=6'd63; i=i+1) begin
num = i;
#10;
end
$finish;
end
endmodule