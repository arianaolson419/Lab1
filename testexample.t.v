`include "testexample.v"


// test the NAND_NOR module with compare logic
module t_NAND_NOR;
   reg R, S;
   wire a, o;

   parameter delay = 1000;

   initial
   begin
      R = 1;
      S = 1;
      // the following just prints the values of the inputs
      // and outputs, but also prints the boolean result of
      // comparing our logic computed output (a and o) with
      // behavioral verilog computed equivalents
      // like ~(R|S) is a NOR
      // then we ask if a is equal to NOR, and display the result
      #delay $display(" %b%b -> %b %b | %b %b",R,S,a,o,a==~(R&S),o==~(R|S));

      R = 0;
      #delay $display(" %b%b -> %b %b | %b %b",R,S,a,o,a==~(R&S),o==~(R|S));
      S = 0;
      #delay $display(" %b%b -> %b %b | %b %b",R,S,a,o,a==~(R&S),o==~(R|S));
      R = 1;
      #delay $display(" %b%b -> %b %b | %b %b",R,S,a,o,a==~(R&S),o==~(R|S));
   end

   NAND_NOR UUT(a,o,R,S);

endmodule // t_NAND_NOR