`timescale 1ns/1ns
module thim(input [15:0]xbus,romout,xsqout,input selx,selq,selrom,output [15:0]fbus);
  assign fbus=(selx)? xbus:(selq)? xsqout: (selrom) ? romout : fbus;
endmodule