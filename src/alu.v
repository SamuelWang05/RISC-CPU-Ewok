/*
ALU Supported Operations:   
--------------------------------
000: Add
001: Sub
010: AND (bitwise)
011: OR (bitwise)
100: XOR (bitwise)
101: SLL (Logical shift left, <<)
110: SRL (Logical shift right, >>)
111: Set on less than
*/

/*
To do:
    - Expand supported operations (i.e. make op to 4 bits)
    - Add more flags to support branching (i.e. carry, negative, overflow, parity)
*/

module ALU (
    input[31:0] a, b,
    input[2:0] op,
    output reg[31:0] result,
    output reg zeroFlag
);

always @(*) begin

    case(op)
        3'b000: result = a + b;
        3'b001: result = a - b;
        3'b010: result = a & b;
        3'b011: result = a | b;
        3'b100: result = a ^ b;
        3'b101: result = a << b;
        3'b110: result = a >> b;
        3'b111: begin
            if(a < b) begin
                result = 1;
            end else begin
                result = 0; 
            end
        end
    endcase

    if(result == 0) begin
        zeroFlag = 1;
    end else begin
        zeroFlag = 0;
    end

end

endmodule