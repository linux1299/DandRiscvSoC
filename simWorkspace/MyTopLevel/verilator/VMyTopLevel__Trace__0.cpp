// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "VMyTopLevel__Syms.h"


void VMyTopLevel___024root__trace_chg_sub_0(VMyTopLevel___024root* vlSelf, VerilatedFst* tracep);

void VMyTopLevel___024root__trace_chg_top_0(void* voidSelf, VerilatedFst* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root__trace_chg_top_0\n"); );
    // Init
    VMyTopLevel___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VMyTopLevel___024root*>(voidSelf);
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    VMyTopLevel___024root__trace_chg_sub_0((&vlSymsp->TOP), tracep);
}

void VMyTopLevel___024root__trace_chg_sub_0(VMyTopLevel___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root__trace_chg_sub_0\n"); );
    // Init
    vluint32_t* const oldp VL_ATTR_UNUSED = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    tracep->chgBit(oldp+0,(vlSelf->io_cond0));
    tracep->chgBit(oldp+1,(vlSelf->io_cond1));
    tracep->chgBit(oldp+2,(vlSelf->io_flag));
    tracep->chgCData(oldp+3,(vlSelf->io_state),8);
    tracep->chgBit(oldp+4,(vlSelf->clk));
    tracep->chgBit(oldp+5,(vlSelf->reset));
    tracep->chgCData(oldp+6,(vlSelf->MyTopLevel__DOT__counter),8);
}

void VMyTopLevel___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root__trace_cleanup\n"); );
    // Init
    VMyTopLevel___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VMyTopLevel___024root*>(voidSelf);
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VlUnpacked<CData/*0:0*/, 1> __Vm_traceActivity;
    // Body
    vlSymsp->__Vm_activity = false;
    __Vm_traceActivity[0U] = 0U;
}
