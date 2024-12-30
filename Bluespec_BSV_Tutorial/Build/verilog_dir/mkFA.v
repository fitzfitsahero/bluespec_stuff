//
// Generated by Bluespec Compiler, version 2022.01-36-ga6304315 (build a6304315)
//
// On Thu Apr  6 19:34:58 EDT 2023
//
//
// Ports:
// Name                         I/O  size props
// sum                            O     1
// RDY_sum                        O     1 const
// cout                           O     1
// RDY_cout                       O     1 const
// CLK                            I     1 unused
// RST_N                          I     1 unused
// sum_a                          I     1
// sum_b                          I     1
// sum_cin                        I     1
// cout_a                         I     1
// cout_b                         I     1
// cout_cin                       I     1
//
// Combinational paths from inputs to outputs:
//   (sum_a, sum_b, sum_cin) -> sum
//   (cout_a, cout_b, cout_cin) -> cout
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkFA(CLK,
	    RST_N,

	    sum_a,
	    sum_b,
	    sum_cin,
	    sum,
	    RDY_sum,

	    cout_a,
	    cout_b,
	    cout_cin,
	    cout,
	    RDY_cout);
  input  CLK;
  input  RST_N;

  // value method sum
  input  sum_a;
  input  sum_b;
  input  sum_cin;
  output sum;
  output RDY_sum;

  // value method cout
  input  cout_a;
  input  cout_b;
  input  cout_cin;
  output cout;
  output RDY_cout;

  // signals for module outputs
  wire RDY_cout, RDY_sum, cout, sum;

  // remaining internal signals
  wire x__h37, x__h58, y__h59, y__h60;

  // value method sum
  assign sum = x__h37 ^ sum_cin ;
  assign RDY_sum = 1'd1 ;

  // value method cout
  assign cout = x__h58 | y__h59 ;
  assign RDY_cout = 1'd1 ;

  // remaining internal signals
  assign x__h37 = sum_a ^ sum_b ;
  assign x__h58 = cout_a & cout_b ;
  assign y__h59 = cout_cin & y__h60 ;
  assign y__h60 = cout_a ^ cout_b ;
endmodule  // mkFA

