`timescale 1ns/1ns
module multi(input [15:0]xx1,xx2,output [15:0]ff);
wire [31:0]m;
assign m=xx1*xx2;
assign ff=m[31:16];
endmodule