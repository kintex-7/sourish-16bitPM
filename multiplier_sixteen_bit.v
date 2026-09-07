`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2026 15:34:21
// Design Name: 
// Module Name: multiplier_sixteen_bit
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


module multiplier_sixteen_bit (
    input  wire [15:0] a,
    input  wire [15:0] b,
    output wire [31:0] product
);

    // ------------------------------------------------
    // Partial products
    // ------------------------------------------------

    wire [255:0] pp;

    partial_products pp_gen (
        .a(a),
        .b(b),
        .pp(pp)
    );


    // ------------------------------------------------
    // Shifted partial-product rows
    // ------------------------------------------------

    wire [31:0] row0;
    wire [31:0] row1;
    wire [31:0] row2;
    wire [31:0] row3;
    wire [31:0] row4;
    wire [31:0] row5;
    wire [31:0] row6;
    wire [31:0] row7;
    wire [31:0] row8;
    wire [31:0] row9;
    wire [31:0] row10;
    wire [31:0] row11;
    wire [31:0] row12;
    wire [31:0] row13;
    wire [31:0] row14;
    wire [31:0] row15;

    assign row0  = {16'b0, pp[15:0]};
    assign row1  = {15'b0, pp[31:16], 1'b0};
    assign row2  = {14'b0, pp[47:32], 2'b0};
    assign row3  = {13'b0, pp[63:48], 3'b0};
    assign row4  = {12'b0, pp[79:64], 4'b0};
    assign row5  = {11'b0, pp[95:80], 5'b0};
    assign row6  = {10'b0, pp[111:96], 6'b0};
    assign row7  = {9'b0, pp[127:112], 7'b0};
    assign row8  = {8'b0, pp[143:128], 8'b0};
    assign row9  = {7'b0, pp[159:144], 9'b0};
    assign row10 = {6'b0, pp[175:160], 10'b0};
    assign row11 = {5'b0, pp[191:176], 11'b0};
    assign row12 = {4'b0, pp[207:192], 12'b0};
    assign row13 = {3'b0, pp[223:208], 13'b0};
    assign row14 = {2'b0, pp[239:224], 14'b0};
    assign row15 = {1'b0, pp[255:240], 15'b0};


    // ------------------------------------------------
    // Intermediate sums
    // ------------------------------------------------

    wire [31:0] sum0;
    wire [31:0] sum1;
    wire [31:0] sum2;
    wire [31:0] sum3;
    wire [31:0] sum4;
    wire [31:0] sum5;
    wire [31:0] sum6;
    wire [31:0] sum7;
    wire [31:0] sum8;
    wire [31:0] sum9;
    wire [31:0] sum10;
    wire [31:0] sum11;
    wire [31:0] sum12;
    wire [31:0] sum13;
    wire [31:0] sum14;

    wire carry0;
    wire carry1;
    wire carry2;
    wire carry3;
    wire carry4;
    wire carry5;
    wire carry6;
    wire carry7;
    wire carry8;
    wire carry9;
    wire carry10;
    wire carry11;
    wire carry12;
    wire carry13;
    wire carry14;


    // ------------------------------------------------
    // Add the partial products
    // ------------------------------------------------

    thirty_two_bit_cla add0 (
        .a(row0),
        .b(row1),
        .cin(1'b0),
        .sum(sum0),
        .cout(carry0)
    );

    thirty_two_bit_cla add1 (
        .a(sum0),
        .b(row2),
        .cin(1'b0),
        .sum(sum1),
        .cout(carry1)
    );

    thirty_two_bit_cla add2 (
        .a(sum1),
        .b(row3),
        .cin(1'b0),
        .sum(sum2),
        .cout(carry2)
    );

    thirty_two_bit_cla add3 (
        .a(sum2),
        .b(row4),
        .cin(1'b0),
        .sum(sum3),
        .cout(carry3)
    );

    thirty_two_bit_cla add4 (
        .a(sum3),
        .b(row5),
        .cin(1'b0),
        .sum(sum4),
        .cout(carry4)
    );

    thirty_two_bit_cla add5 (
        .a(sum4),
        .b(row6),
        .cin(1'b0),
        .sum(sum5),
        .cout(carry5)
    );

    thirty_two_bit_cla add6 (
        .a(sum5),
        .b(row7),
        .cin(1'b0),
        .sum(sum6),
        .cout(carry6)
    );

    thirty_two_bit_cla add7 (
        .a(sum6),
        .b(row8),
        .cin(1'b0),
        .sum(sum7),
        .cout(carry7)
    );

    thirty_two_bit_cla add8 (
        .a(sum7),
        .b(row9),
        .cin(1'b0),
        .sum(sum8),
        .cout(carry8)
    );

    thirty_two_bit_cla add9 (
        .a(sum8),
        .b(row10),
        .cin(1'b0),
        .sum(sum9),
        .cout(carry9)
    );

    thirty_two_bit_cla add10 (
        .a(sum9),
        .b(row11),
        .cin(1'b0),
        .sum(sum10),
        .cout(carry10)
    );

    thirty_two_bit_cla add11 (
        .a(sum10),
        .b(row12),
        .cin(1'b0),
        .sum(sum11),
        .cout(carry11)
    );

    thirty_two_bit_cla add12 (
        .a(sum11),
        .b(row13),
        .cin(1'b0),
        .sum(sum12),
        .cout(carry12)
    );

    thirty_two_bit_cla add13 (
        .a(sum12),
        .b(row14),
        .cin(1'b0),
        .sum(sum13),
        .cout(carry13)
    );

    thirty_two_bit_cla add14 (
        .a(sum13),
        .b(row15),
        .cin(1'b0),
        .sum(sum14),
        .cout(carry14)
    );


    // ------------------------------------------------
    // Final product
    // ------------------------------------------------

    assign product = sum14;

endmodule 