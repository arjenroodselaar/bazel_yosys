// DO NOT EDIT -- auto-generated from hdl/cpu/riscv_formal/isa/gen.py

module rvfi_instruction_jal (
  input                                 rvfi_valid,
  input  [`RISCV_FORMAL_ILEN   - 1 : 0] rvfi_instruction,
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_rdata,
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs1_rdata,
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs2_rdata,
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_rdata,
`ifdef RISCV_FORMAL_CSR_MISA
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_csr_misa_rdata,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_csr_misa_rmask,
`endif

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_rd_wdata,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_pc_wdata,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_addr,
  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_rmask,
  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_wmask,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_wdata
);

  // UJ-type instruction format
  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;
  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[31], rvfi_instruction[19:12], rvfi_instruction[20], rvfi_instruction[30:21], 1'b0});
  wire [4:0] instruction_rd     = rvfi_instruction[11:7];
  wire [6:0] instruction_opcode = rvfi_instruction[6:0];

`ifdef RISCV_FORMAL_CSR_MISA
  wire misa_ok = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h 0) == `RISCV_FORMAL_XLEN'h 0;
  assign spec_csr_misa_rmask = `RISCV_FORMAL_XLEN'h 4;
  wire ialign16 = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h 4) != `RISCV_FORMAL_XLEN'h 0;
`else
  wire misa_ok = 1;
`ifdef RISCV_FORMAL_COMPRESSED
  wire ialign16 = 1;
`else
  wire ialign16 = 0;
`endif
`endif

  // JAL instruction
  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = rvfi_pc_rdata + instruction_imm;
  assign spec_valid = rvfi_valid && !instruction_padding && instruction_opcode == 7'b 1101111;
  assign spec_rd_addr = instruction_rd;
  assign spec_rd_wdata = spec_rd_addr ? rvfi_pc_rdata + 4 : 0;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok;

  // default assignments
  assign spec_rs1_addr = 0;
  assign spec_rs2_addr = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule
