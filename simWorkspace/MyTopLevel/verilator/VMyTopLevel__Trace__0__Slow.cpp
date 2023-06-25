// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "VMyTopLevel__Syms.h"


VL_ATTR_COLD void VMyTopLevel___024root__trace_init_sub__TOP__0(VMyTopLevel___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+1,"io_cond0",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+2,"io_cond1",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+3,"io_flag",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+4,"io_state",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 7,0);
    tracep->declBit(c+5,"clk",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+6,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->pushNamePrefix("MyTopLevel ");
    tracep->declBit(c+1,"io_cond0",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+2,"io_cond1",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+3,"io_flag",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+4,"io_state",-1,FST_VD_OUTPUT,FST_VT_VCD_WIRE, false,-1, 7,0);
    tracep->declBit(c+5,"clk",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBit(c+6,"reset",-1,FST_VD_INPUT,FST_VT_VCD_WIRE, false,-1);
    tracep->declBus(c+7,"counter",-1, FST_VD_IMPLICIT,FST_VT_SV_LOGIC, false,-1, 7,0);
    tracep->popNamePrefix(1);
}

VL_ATTR_COLD void VMyTopLevel___024root__trace_init_top(VMyTopLevel___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root__trace_init_top\n"); );
    // Body
    VMyTopLevel___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VMyTopLevel___024root__trace_full_top_0(void* voidSelf, VerilatedFst* tracep);
void VMyTopLevel___024root__trace_chg_top_0(void* voidSelf, VerilatedFst* tracep);
void VMyTopLevel___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/);

VL_ATTR_COLD void VMyTopLevel___024root__trace_register(VMyTopLevel___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&VMyTopLevel___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&VMyTopLevel___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&VMyTopLevel___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VMyTopLevel___024root__trace_full_sub_0(VMyTopLevel___024root* vlSelf, VerilatedFst* tracep);

VL_ATTR_COLD void VMyTopLevel___024root__trace_full_top_0(void* voidSelf, VerilatedFst* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root__trace_full_top_0\n"); );
    // Init
    VMyTopLevel___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VMyTopLevel___024root*>(voidSelf);
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VMyTopLevel___024root__trace_full_sub_0((&vlSymsp->TOP), tracep);
}

VL_ATTR_COLD void VMyTopLevel___024root__trace_full_sub_0(VMyTopLevel___024root* vlSelf, VerilatedFst* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VMyTopLevel___024root__trace_full_sub_0\n"); );
    // Init
    vluint32_t* const oldp VL_ATTR_UNUSED = tracep->oldp(vlSymsp->__Vm_baseCode);
    // Body
    tracep->fullBit(oldp+1,(vlSelf->io_cond0));
    tracep->fullBit(oldp+2,(vlSelf->io_cond1));
    tracep->fullBit(oldp+3,(vlSelf->io_flag));
    tracep->fullCData(oldp+4,(vlSelf->io_state),8);
    tracep->fullBit(oldp+5,(vlSelf->clk));
    tracep->fullBit(oldp+6,(vlSelf->reset));
    tracep->fullCData(oldp+7,(vlSelf->MyTopLevel__DOT__counter),8);
}
