`timescale 1ns/1ns
module tnhxtst();
  reg clk=0;
  reg rst=1;
  reg start=0;
  reg [15:0]Xbus=16'b0101010101010101;
  //wire [15:0]Rbus;
  wire [15:0]Rbus,Rbuscode;
  wire ready;
  tanhcal ime(ready,clk,rst,start,Xbus,Rbus);
  tnhx s(clk,rst,start,Xbus,ready,Rbuscode);
  initial begin 
    #1000;
    rst=0;
    #1000;
    start=1;
    #2000;
    start=0;
  end
  initial begin
    #1000;
    repeat(100)begin
    clk=~clk;
    #1000;
    end
  end
  initial begin
  #200000;
  $stop;
  end
endmodule