// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VMyTopLevel.h for the primary calling header

#include "verilated.h"

#include "VMyTopLevel___024root.h"

VL_INLINE_OPT void VMyTopLevel___024root___sequent__TOP__1(VMyTopLevel___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root___sequent__TOP__1\n"); );
    // Init
    CData/*7:0*/ __Vdly__MyTopLevel__DOT__counter;
    // Body
    __Vdly__MyTopLevel__DOT__counter = vlSelf->MyTopLevel__DOT__counter;
    if (vlSelf->reset) {
        __Vdly__MyTopLevel__DOT__counter = 0U;
    } else if (vlSelf->io_cond0) {
        __Vdly__MyTopLevel__DOT__counter = (0xffU & 
                                            ((IData)(1U) 
                                             + (IData)(vlSelf->MyTopLevel__DOT__counter)));
    }
    vlSelf->MyTopLevel__DOT__counter = __Vdly__MyTopLevel__DOT__counter;
    vlSelf->io_state = vlSelf->MyTopLevel__DOT__counter;
}

VL_INLINE_OPT void VMyTopLevel___024root___combo__TOP__3(VMyTopLevel___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root___combo__TOP__3\n"); );
    // Body
    vlSelf->io_flag = ((0U == (IData)(vlSelf->MyTopLevel__DOT__counter)) 
                       | (IData)(vlSelf->io_cond1));
}

void VMyTopLevel___024root___eval(VMyTopLevel___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root___eval\n"); );
    // Body
    if ((((IData)(vlSelf->clk) & (~ (IData)(vlSelf->__Vclklast__TOP__clk))) 
         | ((IData)(vlSelf->reset) & (~ (IData)(vlSelf->__Vclklast__TOP__reset))))) {
        VMyTopLevel___024root___sequent__TOP__1(vlSelf);
    }
    VMyTopLevel___024root___combo__TOP__3(vlSelf);
    // Final
    vlSelf->__Vclklast__TOP__clk = vlSelf->clk;
    vlSelf->__Vclklast__TOP__reset = vlSelf->reset;
}

#ifdef VL_DEBUG
void VMyTopLevel___024root___eval_debug_assertions(VMyTopLevel___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->io_cond0 & 0xfeU))) {
        Verilated::overWidthError("io_cond0");}
    if (VL_UNLIKELY((vlSelf->io_cond1 & 0xfeU))) {
        Verilated::overWidthError("io_cond1");}
    if (VL_UNLIKELY((vlSelf->clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
