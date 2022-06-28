`timescale 1ns/1ns
module tim(input [15:0]xbus,obus,input selx,selo,output [15:0]lastbus);
  assign lastbus=(selx)? xbus:(selo)? obus:lastbus ;
endmodule