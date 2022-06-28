`timescale 1ns/1ns
module counter (input clk,rst,in0,inc,output reg[2:0]num,output co,oe);
always @(posedge clk,posedge rst)
if (rst) num<= 3'b0;
else if (in0) num <= 3'b0;
else if (inc) num <= num+1;
else num <= num;
assign co = &{num};
assign oe = num[0];
endmodule