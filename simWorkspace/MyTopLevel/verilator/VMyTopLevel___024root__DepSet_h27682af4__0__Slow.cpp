// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VMyTopLevel.h for the primary calling header

#include "verilated.h"

#include "VMyTopLevel___024root.h"

VL_ATTR_COLD void VMyTopLevel___024root___settle__TOP__2(VMyTopLevel___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root___settle__TOP__2\n"); );
    // Body
    vlSelf->io_state = vlSelf->MyTopLevel__DOT__counter;
    vlSelf->io_flag = ((0U == (IData)(vlSelf->MyTopLevel__DOT__counter)) 
                       | (IData)(vlSelf->io_cond1));
}

VL_ATTR_COLD void VMyTopLevel___024root___eval_initial(VMyTopLevel___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vclklast__TOP__clk = (1U & (~ (IData)(vlSelf->clk)));
    vlSelf->__Vclklast__TOP__reset = (1U & (~ (IData)(vlSelf->reset)));
}

VL_ATTR_COLD void VMyTopLevel___024root___eval_settle(VMyTopLevel___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root___eval_settle\n"); );
    // Body
    VMyTopLevel___024root___settle__TOP__2(vlSelf);
}

VL_ATTR_COLD void VMyTopLevel___024root___final(VMyTopLevel___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root___final\n"); );
}

VL_ATTR_COLD void VMyTopLevel___024root___ctor_var_reset(VMyTopLevel___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->io_cond0 = VL_RAND_RESET_I(1);
    vlSelf->io_cond1 = VL_RAND_RESET_I(1);
    vlSelf->io_flag = VL_RAND_RESET_I(1);
    vlSelf->io_state = VL_RAND_RESET_I(8);
    vlSelf->clk = 0;
    vlSelf->reset = 0;
    vlSelf->MyTopLevel__DOT__counter = VL_RAND_RESET_I(8);
}
