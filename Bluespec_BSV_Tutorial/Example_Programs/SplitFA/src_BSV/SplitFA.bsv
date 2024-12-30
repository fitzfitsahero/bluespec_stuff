package SplitFA;

interface SplitFA_Ifc;
  method Bit#(1) sum (Bit#(1) a, Bit#(1) b, Bit#(1) cin);
  method Bit#(1) cout (Bit#(1) a, Bit#(1) b, Bit#(1) cin);
endinterface : SplitFA_Ifc

(*synthesize*)
module mkSplitFA (SplitFA_Ifc);
  method Bit#(1) sum (Bit#(1) a, Bit#(1) b, Bit#(1) cin);
    return (a ^ b ^ cin);
  endmethod : sum

  method Bit#(1) cout (Bit#(1) a, Bit#(1) b, Bit#(1) cin);
    return (a & b) | (cin & (a ^ b));
  endmethod : cout
endmodule : mkSplitFA

endpackage : SplitFA
