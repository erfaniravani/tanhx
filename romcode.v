`timescale 1ns/1ns
module romcode(input [2:0]Romaddr,output [15:0]Romdata);

  assign  Romdata = (Romaddr == 0)?16'b0101010101010101:
                    (Romaddr == 1)?16'b0110011001100110:
                    (Romaddr == 2)?16'b0110011110011110:
                    (Romaddr == 3)?16'b0110011110111101:
                    (Romaddr == 4)?16'b0110011111000000:
                    (Romaddr == 5)?16'b0110011111000000:
                    (Romaddr == 6)?16'b0110011111000000:
                    (Romaddr == 7)?16'b0110011111000000:
                     16'b0;
endmodule