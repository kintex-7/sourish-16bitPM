`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2026 15:32:30
// Design Name: 
// Module Name: partial_products
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module partial_products(
    input  wire [15:0] a,
    input  wire [15:0] b,
    output wire [255:0] pp
    );
    genvar i;

    generate
        for (i = 0; i < 16; i = i + 1) begin
            assign pp[i*16 +: 16] = a & {16{b[i]}};
        end
    endgenerate 
endmodule
