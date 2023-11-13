// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : Apb4Uart
// Git hash  : 38b6831a37fa06dcbcb618d126b7aa6e621965bd

`timescale 1ns/1ps

module Apb4Uart (
  input      [31:0]   io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [3:0]    io_apb_PSTRB,
  input      [2:0]    io_apb_PPROT,
  input      [31:0]   io_apb_PWDATA,
  output     [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERR,
  output              io_uart_txd,
  input               io_uart_rxd,
  input               io_clock,
  input               io_resetn
);

  wire                uartCtrl_in_pready;
  wire                uartCtrl_in_pslverr;
  wire       [31:0]   uartCtrl_in_prdata;
  wire                uartCtrl_uart_tx;

  uart_apb uartCtrl (
    .clk        (io_clock                ), //i
    .resetn     (io_resetn               ), //i
    .in_psel    (io_apb_PSEL             ), //i
    .in_penable (io_apb_PENABLE          ), //i
    .in_pprot   (io_apb_PPROT[2:0]       ), //i
    .in_pready  (uartCtrl_in_pready      ), //o
    .in_pslverr (uartCtrl_in_pslverr     ), //o
    .in_paddr   (io_apb_PADDR[31:0]      ), //i
    .in_pwrite  (io_apb_PWRITE           ), //i
    .in_prdata  (uartCtrl_in_prdata[31:0]), //o
    .in_pwdata  (io_apb_PWDATA[31:0]     ), //i
    .in_pstrb   (io_apb_PSTRB[3:0]       ), //i
    .uart_rx    (io_uart_rxd             ), //i
    .uart_tx    (uartCtrl_uart_tx        )  //o
  );
  assign io_uart_txd = uartCtrl_uart_tx;
  assign io_apb_PREADY = uartCtrl_in_pready;
  assign io_apb_PSLVERR = uartCtrl_in_pslverr;
  assign io_apb_PRDATA = uartCtrl_in_prdata;

endmodule
