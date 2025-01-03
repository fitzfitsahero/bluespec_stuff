//
// Generated by Bluespec Compiler, version 2022.01-36-ga6304315 (build a6304315)
//
// On Fri Apr  7 13:10:15 EDT 2023
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
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

module mkTestbench(CLK,
		   RST_N);
  input  CLK;
  input  RST_N;

  // ports of submodule fa
  wire fa$cout,
       fa$cout_a,
       fa$cout_b,
       fa$cout_cin,
       fa$sum,
       fa$sum_a,
       fa$sum_b,
       fa$sum_cin;

  // rule scheduling signals
  wire CAN_FIRE_RL_getCout,
       CAN_FIRE_RL_getSum,
       WILL_FIRE_RL_getCout,
       WILL_FIRE_RL_getSum;

  // submodule fa
  mkSplitFA fa(.CLK(CLK),
	       .RST_N(RST_N),
	       .cout_a(fa$cout_a),
	       .cout_b(fa$cout_b),
	       .cout_cin(fa$cout_cin),
	       .sum_a(fa$sum_a),
	       .sum_b(fa$sum_b),
	       .sum_cin(fa$sum_cin),
	       .sum(fa$sum),
	       .RDY_sum(),
	       .cout(fa$cout),
	       .RDY_cout());

  // rule RL_getSum
  assign CAN_FIRE_RL_getSum = 1'd1 ;
  assign WILL_FIRE_RL_getSum = 1'd1 ;

  // rule RL_getCout
  assign CAN_FIRE_RL_getCout = 1'd1 ;
  assign WILL_FIRE_RL_getCout = 1'd1 ;

  // submodule fa
  assign fa$cout_a = 1'd1 ;
  assign fa$cout_b = 1'd1 ;
  assign fa$cout_cin = 1'd1 ;
  assign fa$sum_a = 1'd1 ;
  assign fa$sum_b = 1'd1 ;
  assign fa$sum_cin = 1'd1 ;

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    $display("Sum of 1,1,1= %d", fa$sum);
    $display("Cout of 1,1,1= %d", fa$cout);
    $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkTestbench

