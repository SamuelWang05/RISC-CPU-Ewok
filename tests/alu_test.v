`include "src/alu.v"
`timescale 1ns/1ns

module alu_test();
reg[31:0] a, b;
reg[2:0] op;
wire[31:0] result;
wire zeroFlag;

ALU UUT(a, b, op, result, zeroFlag);

initial begin
    $dumpfile("alu_test.vcd");
    $dumpvars(0, alu_test);

    // add
    a = 32'd5;
    b = 32'd10;
    op = 3'b000;
    #10;

    // sub
    a = 32'd10;
    b = 32'd5;
    op = 3'b001;
    #10;

    // and
    a = 32'd5; // 0...0101
    b = 32'd3; // 0...0011
    op = 3'b010; // Expected result: 0...0001
    #10;

    // or
    a = 32'd5;  
    b = 32'd3;
    op = 3'b011; // Expected result: 0...0111
    #10;

    // xor
    a = 32'd5;
    b = 32'd3;
    op = 3'b100; // Expected result: 0...0110
    #10;

    // SLL
    a = 32'd5;
    b = 32'd2;
    op = 3'b110; // Expected result: 0...10100
    #10;

    // SRL
    a = 32'd4;
    b = 32'd2;
    op = 3'b111; // Expected result: 0...001
    #10;

    // zero
    a = 32'd0;
    b = 32'd0;
    op = 3'b000;
    #10;

    $display("End of test");
end

endmodule