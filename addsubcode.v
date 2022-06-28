`timescale 1ns/1ns
module addsubcode(input [15:0]x1,x2,input sub,output[15:0]f);
assign f = sub ? x1-x2:x1+x2;
endmodule