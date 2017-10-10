module alu_1bitnand
(
  input A,
  input B,
  output AnandB
);
  wire AandB;

and andgate(AandB, A, B);
not notgate(AnandB, AandB);

endmodule

module command
(
  input[2:0] command,
  output which
);

wire nOne;
wire ZeronOne;

not notgate1(nOne, command[1]);
and andgate1(nZeronOne, command[0], nOne);
and andgate2(which, ZeronOne, command[2]);

endmodule

module alu_32bitnand
(
output[31:0]  result,
output        carryout,
output        zero,
output        overflow,
input[31:0]   operandA,
input[31:0]   operandB,
input[2:0]    command
);

genvar idx;
generate
  for (idx=0; idx < 32; idx= idx+1)
  begin: ripple
    alu_1bitnand dut (operandA[idx], operandB[idx], result[idx]);
  end
endgenerate

endmodule
