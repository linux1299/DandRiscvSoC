// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VMyTopLevel.h for the primary calling header

#include "verilated.h"

#include "VMyTopLevel__Syms.h"
#include "VMyTopLevel___024root.h"

void VMyTopLevel___024root___ctor_var_reset(VMyTopLevel___024root* vlSelf);

VMyTopLevel___024root::VMyTopLevel___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VMyTopLevel___024root___ctor_var_reset(this);
}

void VMyTopLevel___024root::__Vconfigure(VMyTopLevel__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VMyTopLevel___024root::~VMyTopLevel___024root() {
}
