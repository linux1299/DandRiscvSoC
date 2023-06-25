// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VMyTopLevel.h for the primary calling header

#ifndef VERILATED_VMYTOPLEVEL___024ROOT_H_
#define VERILATED_VMYTOPLEVEL___024ROOT_H_  // guard

#include "verilated.h"

class VMyTopLevel__Syms;
VL_MODULE(VMyTopLevel___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_cond0,0,0);
    VL_IN8(io_cond1,0,0);
    VL_OUT8(io_flag,0,0);
    VL_OUT8(io_state,7,0);
    CData/*7:0*/ MyTopLevel__DOT__counter;
    CData/*0:0*/ __Vclklast__TOP__clk;
    CData/*0:0*/ __Vclklast__TOP__reset;

    // INTERNAL VARIABLES
    VMyTopLevel__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
    VMyTopLevel___024root(const char* name);
    ~VMyTopLevel___024root();
    VL_UNCOPYABLE(VMyTopLevel___024root);

    // INTERNAL METHODS
    void __Vconfigure(VMyTopLevel__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
