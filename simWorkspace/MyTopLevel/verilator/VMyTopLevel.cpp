// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VMyTopLevel.h"
#include "VMyTopLevel__Syms.h"
#include "verilated_fst_c.h"

//============================================================
// Constructors

VMyTopLevel::VMyTopLevel(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VMyTopLevel__Syms(_vcontextp__, _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , reset{vlSymsp->TOP.reset}
    , io_cond0{vlSymsp->TOP.io_cond0}
    , io_cond1{vlSymsp->TOP.io_cond1}
    , io_flag{vlSymsp->TOP.io_flag}
    , io_state{vlSymsp->TOP.io_state}
    , rootp{&(vlSymsp->TOP)}
{
}

VMyTopLevel::VMyTopLevel(const char* _vcname__)
    : VMyTopLevel(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VMyTopLevel::~VMyTopLevel() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VMyTopLevel___024root___eval_initial(VMyTopLevel___024root* vlSelf);
void VMyTopLevel___024root___eval_settle(VMyTopLevel___024root* vlSelf);
void VMyTopLevel___024root___eval(VMyTopLevel___024root* vlSelf);
#ifdef VL_DEBUG
void VMyTopLevel___024root___eval_debug_assertions(VMyTopLevel___024root* vlSelf);
#endif  // VL_DEBUG
void VMyTopLevel___024root___final(VMyTopLevel___024root* vlSelf);

static void _eval_initial_loop(VMyTopLevel__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VMyTopLevel___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VMyTopLevel___024root___eval_settle(&(vlSymsp->TOP));
        VMyTopLevel___024root___eval(&(vlSymsp->TOP));
    } while (0);
}

void VMyTopLevel::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VMyTopLevel::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VMyTopLevel___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VMyTopLevel___024root___eval(&(vlSymsp->TOP));
    } while (0);
    // Evaluate cleanup
}

//============================================================
// Utilities

VerilatedContext* VMyTopLevel::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VMyTopLevel::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

VL_ATTR_COLD void VMyTopLevel::final() {
    VMyTopLevel___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Trace configuration

void VMyTopLevel___024root__trace_init_top(VMyTopLevel___024root* vlSelf, VerilatedFst* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedFst* tracep, uint32_t code) {
    // Callback from tracep->open()
    VMyTopLevel___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VMyTopLevel___024root*>(voidSelf);
    VMyTopLevel__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->scopeEscape(' ');
    tracep->pushNamePrefix(std::string{vlSymsp->name()} + ' ');
    VMyTopLevel___024root__trace_init_top(vlSelf, tracep);
    tracep->popNamePrefix();
    tracep->scopeEscape('.');
}

VL_ATTR_COLD void VMyTopLevel___024root__trace_register(VMyTopLevel___024root* vlSelf, VerilatedFst* tracep);

VL_ATTR_COLD void VMyTopLevel::trace(VerilatedFstC* tfp, int levels, int options) {
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    VMyTopLevel___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
