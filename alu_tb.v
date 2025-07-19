`timescale 1ns / 1ps

module alu_tb;

reg [2:0] opcode;
reg [7:0] operandA;
reg [7:0] operandB;
wire [7:0] result;

alu uut (
    .opcode(opcode),
    .operandA(operandA),
    .operandB(operandB),
    .result(result)
);

initial begin
    $monitor("opcode = %b | operandA = %d | operandB = %d | result = %d", opcode, operandA, operandB, result);

    // Test ADD
    opcode = 3'b000; operandA = 8'd10; operandB = 8'd5; #10;

    // Test SUB
    opcode = 3'b001; operandA = 8'd20; operandB = 8'd7; #10;

    // Test AND
    opcode = 3'b010; operandA = 8'b10101010; operandB = 8'b11001100; #10;

    // Test OR
    opcode = 3'b011; operandA = 8'b10101010; operandB = 8'b01010101; #10;

    // Test XOR
    opcode = 3'b100; operandA = 8'b11110000; operandB = 8'b00001111; #10;

    // Test NOT
    opcode = 3'b101; operandA = 8'b11110000; operandB = 8'd0; #10;

    // Test Shift Left
    opcode = 3'b110; operandA = 8'b00001111; operandB = 8'd0; #10;

    // Test Shift Right
    opcode = 3'b111; operandA = 8'b11110000; operandB = 8'd0; #10;

    $finish;
end

endmodule
