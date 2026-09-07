`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2026 15:28:40
// Design Name: 
// Module Name: sixteen_bit_cla
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


module sixteen_bit_cla(
    input  wire [15:0] a,
    input  wire [15:0] b,
    input  wire        cin,
    output wire [15:0] sum,
    output wire        cout 
    );
     wire c4, c8, c12;

    four_bit_cla cla0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(c4)
    );

    four_bit_cla cla1 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c4),
        .sum(sum[7:4]),
        .cout(c8)
    );

    four_bit_cla cla2 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(c8),
        .sum(sum[11:8]),
        .cout(c12)
    );

    four_bit_cla cla3 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(c12),
        .sum(sum[15:12]),
        .cout(cout)
    );
endmodule
