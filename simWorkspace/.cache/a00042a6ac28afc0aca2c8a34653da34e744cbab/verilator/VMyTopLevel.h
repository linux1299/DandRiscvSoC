// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VMyTopLevel_H_
#define _VMyTopLevel_H_

#include "verilated.h"

class VMyTopLevel__Syms;
class VerilatedFst;

//----------

VL_MODULE(VMyTopLevel) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    // Begin mtask footprint  all: 
    VL_IN8(clk,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_cond0,0,0);
    VL_IN8(io_cond1,0,0);
    VL_OUT8(io_flag,0,0);
    VL_OUT8(io_state,7,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    // Begin mtask footprint  all: 
    VL_SIG8(MyTopLevel__DOT__counter,7,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    // Begin mtask footprint  all: 
    VL_SIG8(__Vclklast__TOP__clk,0,0);
    VL_SIG8(__Vclklast__TOP__reset,0,0);
    VL_SIG(__Vm_traceActivity,31,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VMyTopLevel__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VMyTopLevel);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    VMyTopLevel(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~VMyTopLevel();
    /// Trace signals in the model; called by application code
    void trace(VerilatedFstC* tfp, int levels, int options=0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(VMyTopLevel__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(VMyTopLevel__Syms* symsp, bool first);
  private:
    static QData _change_request(VMyTopLevel__Syms* __restrict vlSymsp);
    static QData _change_request_1(VMyTopLevel__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__3(VMyTopLevel__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(VMyTopLevel__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(VMyTopLevel__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(VMyTopLevel__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__1(VMyTopLevel__Syms* __restrict vlSymsp);
    static void _settle__TOP__2(VMyTopLevel__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(VMyTopLevel__Syms* __restrict vlSymsp, VerilatedFst* vcdp, uint32_t code);
    static void traceChgThis__2(VMyTopLevel__Syms* __restrict vlSymsp, VerilatedFst* vcdp, uint32_t code);
    static void traceChgThis__3(VMyTopLevel__Syms* __restrict vlSymsp, VerilatedFst* vcdp, uint32_t code);
    static void traceFullThis(VMyTopLevel__Syms* __restrict vlSymsp, VerilatedFst* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(VMyTopLevel__Syms* __restrict vlSymsp, VerilatedFst* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(VMyTopLevel__Syms* __restrict vlSymsp, VerilatedFst* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(VMyTopLevel__Syms* __restrict vlSymsp, VerilatedFst* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedFst* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedFst* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedFst* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(128);

#endif // guard
