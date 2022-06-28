`timescale 1ns/1ns
module controll(input Clk,Rst,Start,Co,Oe,output reg sub,selx,selm,selq,selrom,selt,sela,ldq,ldt,lde,in0,inc,ready);
  reg [2:0]ps,ns;
  always @(posedge Clk,posedge Rst)begin
    if(Rst) ps<=3'b0;
    else ps<=ns;
  end
  always @(Start,Co,ps,Oe)begin
    ns=3'b0;
    {inc,in0,ldt,ldq,lde,selm,selx,selq,selrom,selt,sela,ready,sub}=13'b0;
    case(ps)
      3'b000:begin
        ns = Start ? 3'b001:3'b000;
        ready = 1'b1;
      end
      3'b001: begin
        ns = Start ? 3'b001:3'b010;
      end
      3'b010:begin
        ns = 3'b011;
        in0 = 1'b1;
        selx = 1'b1;
        ldq = 1'b1;
        lde = 1'b1;
        ldt = 1'b1;
      end
      3'b011:begin
        ns = 3'b100;
        selq = 1'b1;
        selt = 1'b1;
        selm = 1'b1;
        ldt = 1'b1;
      end
      3'b100:begin
        ns = 3'b101;
        selrom = 1'b1;
        selt = 1'b1;
        selm = 1'b1;
        ldt = 1'b1;
      end
      3'b101:begin
        ns = Co ? 3'b000:3'b011;
        lde = 1'b1;
        sela = 1'b1;
        inc = 1'b1;
        sub = ~(Oe)?1'b1:1'b0;
      end
      default:{inc,in0,ldt,ldq,lde,selm,selx,selq,selrom,selt,sela,ready,sub}=13'b0;
    endcase
  end
endmodule
    