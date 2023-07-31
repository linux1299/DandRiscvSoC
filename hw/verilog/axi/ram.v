module ram (
    input        clk,
    input        rst_n,

    input [63:0] wr_data,
    input [11:0] wr_addr,
    input        wr_en,
    input [7:0]  wr_mask,

    input [11:0] rd_addr,
    output[63:0] rd_data
);

reg [63:0] ram [0:65535];
reg [63:0] ram_tmp [0:65535];

integer fd;
integer tmp;

integer i;
integer j;

initial begin

    //--------------cpu-tests----------------
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/add-longlong-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/add-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/bit-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/bubble-sort-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/div-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/dummy-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/fact-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/fib-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/goldbach-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/hello-str-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/if-else-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/leap-year-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/load-store-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/matrix-mul-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/max-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/min3-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/mov-c-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/movsx-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/mul-longlong-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/pascal-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/prime-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/quick-sort-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/recursion-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/select-sort-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/shift-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/shuixianhua-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/string-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/sub-longlong-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/sum-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/switch-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/to-lower-case-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/unalign-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/cpu-tests/wanshu-riscv64-mycpu.bin", "rb");

    //----------riscv-tests----------
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/addi-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/addiw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/add-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/addw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/andi-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/and-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/auipc-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/beq-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/bge-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/bgeu-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/blt-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/bltu-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/bne-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/jal-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/jalr-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/lbu-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/ld-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/lh-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/lhu-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/lui-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/lw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/lwu-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/ori-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/or-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sb-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sd-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sh-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/simple-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/slli-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/slliw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sll-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sllw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/slti-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sltiu-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/slt-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sltu-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/srai-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sraiw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sra-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sraw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/srli-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/srliw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/srl-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/srlw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sub-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/subw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/sw-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/xori-riscv64-mycpu.bin", "rb");
    //fd = $fopen ("/home/IC/Projects/cpu/case/riscv-tests/xor-riscv64-mycpu.bin", "rb");

    // ----------amtest-yield-test ----------
    fd = $fopen ("/home/IC/Projects/cpu/case/custom-output/yield-test/amtest-yield-test.bin", "rb");

    tmp = $fread(ram_tmp, fd);

    for (i = 0; i < 65536; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
            ram[i][j*8 +: 8] = ram_tmp[i][(7-j)*8 +: 8];
        end
    end
end

wire [63:0] mask = {{8{wr_mask[7]}},
                    {8{wr_mask[6]}},
                    {8{wr_mask[5]}},
                    {8{wr_mask[4]}},
                    {8{wr_mask[3]}},
                    {8{wr_mask[2]}},
                    {8{wr_mask[1]}},
                    {8{wr_mask[0]}}};


always @(posedge clk) begin
    if (wr_en) begin
        ram[wr_addr] <= (wr_data & mask) | (ram[wr_addr] & ~mask);
    end
end

assign rd_data = ram[rd_addr];

endmodule