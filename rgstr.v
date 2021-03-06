`timescale 1ns/1ns
module rgstr(input clk,rst,load,input [15:0]inbus,output reg [15:0]outbus);
always@(posedge clk,posedge rst) begin 
    if(rst) outbus <= 16'b0;
    else if(load) outbus <= inbus;
	 else outbus <= outbus;
  end
 endmodule