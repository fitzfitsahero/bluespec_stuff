package Testbench;

import SplitFA :: *;

(*synthesize*)
module mkTestbench();

  SplitFA_Ifc fa <- mkSplitFA;

  rule getSum;
    let s = fa.sum(1,1,1);
    $display("Sum of 1,1,1= %d", s);
  endrule : getSum

  rule getCout;
    let co = fa.cout(1,1,1);
    $display("Cout of 1,1,1= %d", co);
    $finish;
  endrule : getCout

endmodule : mkTestbench

endpackage : Testbench
