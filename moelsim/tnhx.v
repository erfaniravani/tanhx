`timescale 1 ns/ 1 ns
module tnhx(input clk,rst,start,input[15:0]Xbus,output ready,output[15:0]Rbus);
  wire In0c,Upc,selq,selr,selt,sela,selx,selm,Ldq,LdT,Lde,addsub,Oe,Co;
  
  dtpth DP(clk,rst,addsub,selx,selm,selq,selr,selt,sela,Ldq,LdT,Lde,Upc,In0c,Xbus,Rbus,Co,Oe);
  
  cntrlunt shcu(clk,rst,start,Co,Oe,addsub,selx,selm,selq,selr,selt,sela,Ldq,LdT,Lde,In0c,Upc,ready);
  
endmodule
