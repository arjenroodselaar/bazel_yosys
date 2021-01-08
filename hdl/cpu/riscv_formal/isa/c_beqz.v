// DO NOT EDIT -- auto-generated from hdl/cpu/riscv_formal/isa/gen.py

module rvfi_instruction_c_beqz (
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

  // CB-type instruction format
  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;
  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[12], rvfi_instruction[6:5], rvfi_instruction[2], rvfi_instruction[11:10], rvfi_instruction[4:3], 1'b0});
  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];
  wire [4:0] instruction_rs1 = {1'b1, rvfi_instruction[9:7]};
  wire [1:0] instruction_opcode = rvfi_instruction[1:0];

`ifdef RISCV_FORMAL_CSR_MISA
  wire misa_ok = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h 4) == `RISCV_FORMAL_XLEN'h 4;
  assign spec_csr_misa_rmask = `RISCV_FORMAL_XLEN'h 4;
`else
  wire misa_ok = 1;
`endif

  // C_BEQZ instruction
  wire cond = rvfi_rs1_rdata == 0;
  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = cond ? rvfi_pc_rdata + instruction_imm : rvfi_pc_rdata + 2;
  assign spec_valid = rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 110 && instruction_opcode == 2'b 01;
  assign spec_rs1_addr = instruction_rs1;
  assign spec_pc_wdata = next_pc;
  assign spec_trap = (next_pc[0] != 0) || !misa_ok;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule
