/*
 * Generated by Bluespec Compiler, version 2022.01-36-ga6304315 (build a6304315)
 * 
 * On Sun Apr  9 19:34:26 EDT 2023
 * 
 */

/* Generation options: keep-fires */
#ifndef __mkFA_h__
#define __mkFA_h__

#include "bluesim_types.h"
#include "bs_module.h"
#include "bluesim_primitives.h"
#include "bs_vcd.h"


/* Class declaration for the mkFA module */
class MOD_mkFA : public Module {
 
 /* Clock handles */
 private:
  tClock __clk_handle_0;
 
 /* Clock gate handles */
 public:
  tUInt8 *clk_gate[0];
 
 /* Instantiation parameters */
 public:
 
 /* Module state */
 public:
 
 /* Constructor */
 public:
  MOD_mkFA(tSimStateHdl simHdl, char const *name, Module *parent);
 
 /* Symbol init methods */
 private:
  void init_symbols_0();
 
 /* Reset signal definitions */
 private:
  tUInt8 PORT_RST_N;
 
 /* Port definitions */
 public:
  tUInt8 PORT_fa_a;
  tUInt8 PORT_fa_b;
  tUInt8 PORT_fa_c;
  tUInt8 PORT_fa;
  tUInt8 PORT_RDY_fa;
 
 /* Publicly accessible definitions */
 public:
  tUInt8 DEF_CAN_FIRE_fa;
 
 /* Local definitions */
 private:
 
 /* Rules */
 public:
 
 /* Methods */
 public:
  tUInt8 METH_fa(tUInt8 ARG_fa_a, tUInt8 ARG_fa_b, tUInt8 ARG_fa_c);
  tUInt8 METH_RDY_fa();
 
 /* Reset routines */
 public:
  void reset_RST_N(tUInt8 ARG_rst_in);
 
 /* Static handles to reset routines */
 public:
 
 /* Pointers to reset fns in parent module for asserting output resets */
 private:
 
 /* Functions for the parent module to register its reset fns */
 public:
 
 /* Functions to set the elaborated clock id */
 public:
  void set_clk_0(char const *s);
 
 /* State dumping routine */
 public:
  void dump_state(unsigned int indent);
 
 /* VCD dumping routines */
 public:
  unsigned int dump_VCD_defs(unsigned int levels);
  void dump_VCD(tVCDDumpType dt, unsigned int levels, MOD_mkFA &backing);
  void vcd_defs(tVCDDumpType dt, MOD_mkFA &backing);
};

#endif /* ifndef __mkFA_h__ */
