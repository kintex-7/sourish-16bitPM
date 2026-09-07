`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2026 15:40:14
// Design Name: 
// Module Name: thirty_two_bit_cla
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


module thirty_two_bit_cla (
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire        cin,
    output wire [31:0] sum,
    output wire        cout
);

    wire carry_16;

    // Lower 16 bits
    sixteen_bit_cla cla0 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(cin),
        .sum(sum[15:0]),
        .cout(carry_16)
    );

    // Upper 16 bits
    sixteen_bit_cla cla1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry_16), 
        .sum(sum[31:16]),
        .cout(cout)
    );

endmodule
