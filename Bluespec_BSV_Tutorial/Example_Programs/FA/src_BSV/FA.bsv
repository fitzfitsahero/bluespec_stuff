package FA;

interface FA_Ifc;
  method Bit#(2) fa(Bit#(1) a, Bit#(1)b, Bit#(1)c);
endinterface : FA_Ifc

(*synthesize*)
module mkFA (FA_Ifc);
  method Bit#(2) fa(Bit#(1) a, Bit#(1)b, Bit#(1)c);
    let s = a ^ b ^ c;
    let cout = (a & b) | (c & (a ^ b));
    return {s,cout};
  endmethod : fa
endmodule : mkFA

endpackage : FA
