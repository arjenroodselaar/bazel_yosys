// DO NOT EDIT -- auto-generated from hdl/cpu/riscv_formal/isa/gen.py

module rvfi_instruction_srliw (
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

  // I-type instruction format (shift variation)
  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;
  wire [6:0] instruction_funct6 = rvfi_instruction[31:26];
  wire [5:0] instruction_shamt  = rvfi_instruction[25:20];
  wire [4:0] instruction_rs1    = rvfi_instruction[19:15];
  wire [2:0] instruction_funct3 = rvfi_instruction[14:12];
  wire [4:0] instruction_rd     = rvfi_instruction[11: 7];
  wire [6:0] instruction_opcode = rvfi_instruction[ 6: 0];

`ifdef RISCV_FORMAL_CSR_MISA
  wire misa_ok = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h 0) == `RISCV_FORMAL_XLEN'h 0;
  assign spec_csr_misa_rmask = `RISCV_FORMAL_XLEN'h 0;
`else
  wire misa_ok = 1;
`endif

  // SRLIW instruction
  wire [31:0] result = rvfi_rs1_rdata[31:0] >> instruction_shamt;
  assign spec_valid = rvfi_valid && !instruction_padding && instruction_funct6 == 6'b 000000 && instruction_funct3 == 3'b 101 && instruction_opcode == 7'b 0011011 && !instruction_shamt[5];
  assign spec_rs1_addr = instruction_rs1;
  assign spec_rd_addr = instruction_rd;
  assign spec_rd_wdata = spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 4;

  // default assignments
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule
