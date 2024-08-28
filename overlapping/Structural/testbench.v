module assignment_tb;
reg clk,rst,t;
wire y;
structural_assign dut(y,clk,rst,t);
always #5 clk = ~clk;
initial
begin
#0 clk=0;rst=1'b1;t=0;
#8 rst = 1'b0;t=1;
#10 t = 0;
#10 t = 1;
#10 t = 1;
#10 t = 0;
#10 t = 1;
#10 t = 0;
#10 t = 1;
#10 t = 1;
#10 t = 0;
#10 t = 1;
#10 t = 1;
#10 t = 1;
#10 t = 0;
#20 $finish;
end
endmodule
