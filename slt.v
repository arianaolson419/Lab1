module alu_32bitsub
(
  input[31:0] A,
  input[31:0] B,
  output[31:0] diff,
  output carryout,
  output overflow,
  output zero
);
// code here

endmodule

module command
(
  input[2:0] command,
  output which
);

wire nZero;
wire nZeroOne;

not notgate0(nZero, command[0]);
and andgate1(nZeroOne, nZero, command[1]);
and andgate2(which, nZeronOne, command[2]);

endmodule

module alu_32bitslt
(
output[31:0]  result,
output        carryout,
output        zero,
output        overflow,
input[31:0]   operandA,
input[31:0]   operandB,
input[2:0]    command
);
  wire [31:0] subtract;
  wire carryout1;
  wire overflow1;
  wire zero1;
  wire bit;

  alu_32bitsub dut (operandA, operandB, subtract, carryout1, overflow1, zero1);

  assign result = 32'b0;

  xor xorgate(result[31], subtract[31], overflow);



endmodule
