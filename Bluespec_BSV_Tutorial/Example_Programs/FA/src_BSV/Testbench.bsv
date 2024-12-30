package Testbench;

import FA :: *;

(*synthesize*)
module mkTestbench();

  FA_Ifc fa <- mkFA;

  Reg#(Bit#(3)) cycle <- mkReg(0);

  rule add;
    if(cycle == 8)
      begin
      $display("Done");
      $finish;
      end
    else
      begin
        let 
      end
    let out = fa.fa(0,0,1);
    let x = pack(out);
    //$display("Sum of 0,0,1=%d", out);
    $display("Sum of 0,0,1= %d", x);
    out = fa.fa(0,1,0);
    $display("Sum of 0,1,0=%d", out);
    out = fa.fa(0,1,1);
    $display("Sum of 0,1,1=%d", out);
    out = fa.fa(1,0,0);
    $display("Sum of 1,0,0=%d", out);
    out = fa.fa(1,1,0);
    $display("Sum of 1,1,0=%d", out);
    out = fa.fa(1,0,1);
    $display("Sum of 1,0,1=%d", out);
    out = fa.fa(1,1,1);
    $display("Sum of 1,1,1=%d", out);
   $finish;
  endrule : add

endmodule : mkTestbench

endpackage : Testbench
