`timescale 1ns/1ns
module dtpth(input Clk,Rst,sub,selx,selm,selq,selrom,selt,sela,ldq,ldt,lde,inc,in0,input [15:0]X,output reg [15:0]Rbus,output reg Co,Oe);
  reg [15:0]X1,X2,Mbus,Addbus,Ebus,Tbus,Expr,Xsq,Term,Qout;
  reg [2:0]Addrom;
  reg [31:0]M;
  //adding or subtracting
  always @(sub,Expr,Term)begin
    Addbus<=sub?(Expr-Term):(Expr+Term);
  end
  //multiply
  always @(X1,X2)begin
    M=X1*X2;
  end
  //multiplier output
  always @(M)begin
    Mbus<=M[31:16];
  end
  //first mux for multiplier
  always @(selx,selq,selrom,Qout)begin
    X1<=selx?X:
    selq?Xsq:
    selrom?Qout:16'b0;
  end
  //second mux for multiplier
  always @(selx,selt,Term)begin
    X2<=selx?X:
    selt?Term:16'b0;
  end
  //output
  always @(Rbus,Expr)begin
    Rbus<=Expr;
  end
  //mux for term register
  always @(selx,selm,Mbus)begin
    Tbus<=selx?X:
    selm?Mbus:16'b0;
  end
  //mux for expr register
  always @(selx,sela,Addbus)begin
    Ebus<=selx?X:
    sela?Addbus:16'b0;
  end
  //xsq register
  always @(posedge Clk,posedge Rst)begin
    if(Rst) Xsq<=16'b0;
    else if(ldq)Xsq<=Mbus;
  end
  //term register
  always @(posedge Clk,posedge Rst)begin
    if(Rst) Term<=16'b0;
    else if(ldt) Term<=Tbus;
  end
  //expr register
  always @(posedge Clk,posedge Rst)begin
    if(Rst) Expr<=16'b0;
    else if(lde) Expr<=Ebus;
  end
  //counter for ROM
  always @(posedge Clk,posedge Rst)begin
    if(Rst) Addrom<=3'b0;
    else if(in0) Addrom<=3'b0;
    else if(inc) Addrom<=Addrom+1;
  end
  //carryout of counter
  always @(Addrom)begin
    Co<=Addrom[0]&Addrom[1]&Addrom[2];
  end
  //Even or Odd flag
  always @(Addrom)begin
    Oe<=Addrom[0];
  end
  //ROM
  always @(Addrom)begin
    Qout<=(Addrom==3'b000)?16'b0101010101010101:
          (Addrom==3'b001)?16'b0110011001100110:
          (Addrom==3'b010)?16'b0110011110011110:
          (Addrom==3'b011)?16'b0110011110111101:
          (Addrom==3'b100)?16'b0110011111000000:
          (Addrom==3'b101)?16'b0110011111000000:
          (Addrom==3'b110)?16'b0110011111000000:
          (Addrom==3'b111)?16'b0110011111000000:16'b0;
  end
  
  
endmodule


