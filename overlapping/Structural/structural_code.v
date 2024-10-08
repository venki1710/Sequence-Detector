module mux(y,i0,i1,i2,i3,i4,i5,i6,i7,s2,s1,s0);
output y;
input i0,i1,i2,i3,i4,i5,i6,i7;
input s0,s1,s2;
wire w1,w2,w3,p0,p1,p2,p3,p4,p5,p6,p7;
not g1(w1,s2);
not g2(w2,s1);
not g3(w3,s0);
and g4(p0,w1,w2,w3,i0);
and g5(p1,w1,w2,s0,i1);
and g6(p2,w1,s1,w3,i2);
and g7(p3,w1,s1,s0,i3);
and g8(p4,s2,w2,w3,i4);
and g9(p5,s2,w2,s0,i5);
and g10(p6,s2,s1,w3,i6);
and g11(p7,s2,s1,s0,i7);
or g12(y,p0,p1,p2,p3,p4,p5,p6,p7);
endmodule


module structural_assign(y,clk,rst,t);
input clk,rst,t;
output reg y;
reg a,b,c;
wire da,db,dc,dd;
mux m1(da,0,0,0,t,~t,0,0,0,a,b,c);
mux m2(db,0,~t,t,~t,0,t,0,0,a,b,c);
mux m3(dc,t,t,t,0,1,t,0,0,a,b,c);
mux m4(dd,0,0,0,0,~t,0,0,0,a,b,c);
always@(posedge clk)
begin
if(rst==1'b1)
begin
a <= 0;
b <= 0;
c <= 0;
end
else
begin
a <= da;
b <= db;
c <= dc;
y<=dd;
end
end
endmodule
