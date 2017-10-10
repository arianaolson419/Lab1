module alu_1bitand
(
  input A,
  input B,
  output AandB
);

and andgate(AandB, A, B);

endmodule

module command
(
  input[2:0] command,
  output which
);

wire nZero;
wire nOne;
wire nTwo;
wire nZeronOne;

not notgate0(nZero, command[0]);
not notgate1(nOne, command[1]);
not notgate2(nTwo, command[2]);
and andgate1(nZeronOne, nZero, nOne);
and andgate2(which, nZeronOne, nTwo);

endmodule

module alu_32bitand
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
    alu_1bitand dut (operandA[idx], operandB[idx], result[idx]);
  end
endgenerate

endmodule
