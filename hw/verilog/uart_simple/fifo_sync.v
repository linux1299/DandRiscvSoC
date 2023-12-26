// Filename      : fifo_sync.v
// Created On    : 2021.11.08
// Last Modified : 2021.11.08
// Author        : Lin Youxu
// Company       : Tsinghua University
// Description   : Synchronous FIFO

module fifo_sync #(
    parameter PTR_WIDTH  = 4,
    parameter FIFO_DEPTH = 16,
    parameter FIFO_WIDTH = 32
)
(
    input                       clk,
    input                       rst_n,
    input                       read,
    input                       write,
    input  [FIFO_WIDTH - 1 : 0] fifo_in,
    output [FIFO_WIDTH - 1 : 0] fifo_out,
    output                      fifo_empty,
    output                      fifo_full
);

reg     [PTR_WIDTH      : 0]    read_ptr;
reg     [PTR_WIDTH      : 0]    write_ptr;
wire    [PTR_WIDTH - 1  : 0]    read_addr;
wire    [PTR_WIDTH - 1  : 0]    write_addr;

wire                            read_msb;
wire                            write_msb;

reg     [FIFO_WIDTH - 1 : 0]    fifo_ram [FIFO_DEPTH - 1 : 0];

// ---------- read and write addr ----------
assign read_addr  = read_ptr[PTR_WIDTH-1:0];
assign write_addr = write_ptr[PTR_WIDTH-1:0];
assign read_msb   = read_ptr[PTR_WIDTH];
assign write_msb  = write_ptr[PTR_WIDTH];


// --------------- read pointer ------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        read_ptr <= 0;
    end
    // When read and FIFO is not empty, read is valid
    else if (read && !fifo_empty) begin
        read_ptr <= read_ptr + 1'b1;
    end
end

// ----- write pointer & FIFO RAM ----------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        write_ptr            <= 0;
        fifo_ram[write_addr] <= fifo_in;
    end
    // When write and FIFO is not full, write is valid
    else if (write && !fifo_full) begin
        write_ptr            <= write_ptr + 1'b1;
        fifo_ram[write_addr] <= fifo_in;
    end
end

assign fifo_out   = fifo_ram[read_addr];

assign fifo_empty = (write_ptr == read_ptr);

// When write pointer wrapback, fifo is full
assign fifo_full  = (write_addr == read_addr)
                 && (write_msb  != read_msb);

endmodule