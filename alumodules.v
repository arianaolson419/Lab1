//defining delays
`define AND and #20
`define OR or #20
`define XOR xor #20
`define NOT not #10

//xors 32 bits using a for loop and looping through each bit
module alu32bitxor
(
output[31:0]  result,
output        carryout,
output        zero,
output        overflow,
input[31:0]   operandA,
input[31:0]   operandB
);

genvar i;
generate
  for (i = 0; i < 32; i = i + 1)
  begin: ripple
    `XOR xorgate (result[i], operandA[i], operandB[i]);
  end
endgenerate

//doesn't need to set a flag
assign carryout = 0;
assign zero = 0;
assign overflow = 0;

endmodule

//ands or nands 32 bits using a for loop and looping through each bit
//if other control signal is one it negates output
module alu32bitandn
(
output[31:0]  result,
output        carryout,
output        zero,
output        overflow,
input[31:0]   operandA,
input[31:0]   operandB,
input         othercontrolsignal
);
wire interresult[31:0];

genvar i;
generate
  for (i = 0; i < 32; i = i + 1)
  begin: ripple0
    `AND andgate (interresult[i], operandA[i], operandB[i]);
  end
endgenerate

genvar j;
generate
  for (j = 0; j < 32; j = j + 1)
  begin: ripple1
    `XOR final (result[j], othercontrolsignal, interresult[j]);
  end
endgenerate

//doesn't need to set a flag
assign carryout = 0;
assign zero = 0;
assign overflow = 0;

endmodule

//here to make the code run
module AddSub
(
output[31:0] result,
output carryout,
output zero,
output overflow,
input[31:0] operandA,
input[31:0] operandB,
input subtract
);

// code here

endmodule

//the set-less-than command, uses the 32-bit subtractor
module alu32bitslt
(
output[31:0]  result,
output        carryout,
output        zero,
output        overflow,
input[31:0]   operandA,
input[31:0]   operandB
);
wire[31:0] subresult;
wire subcarryout;
wire subzero;
wire suboverflow;

//set invertB to 1 because subtraction is needed
AddSub dut (subresult, subcarryout, subzero, suboverflow, operandA, operandB, 1);

assign result = 32'b0;

`XOR final (result[0], subresult[0], suboverflow);

//doesn't need to set a flag
assign carryout = 0;
assign zero = 0;
assign overflow = 0;

endmodule
