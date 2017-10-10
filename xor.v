module alu_1bitxor
(
  input A,
  input B,
  output AxorB
);

xor xorgate(AxorB, A, B);

endmodule

module command
(
  input[2:0] command,
  output which
);

wire nZero;
wire nTwo;
wire nZeroOne;

not notgate0(nZero, command[0]);
not notgate0(nTwo, command[2]);
and andgate0(nZeroOne, nZero, command[1]);
and andgate1(which, nZeroOne, nTwo);

endmodule

module alu_32bitxor
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
    alu_1bitxor dut (operandA[idx], operandB[idx], result[idx]);
  end
endgenerate

endmodule
