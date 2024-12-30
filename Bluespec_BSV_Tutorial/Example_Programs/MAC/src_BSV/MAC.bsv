
package MAC;

interface MAC_IFC;
  method ActionValue #(int) a;
endinterface

(* synthesize *)
module mkMAC (MAC_IFC);

  method Action(int) a;
    re
  endmethod
endmodule

endpackage
