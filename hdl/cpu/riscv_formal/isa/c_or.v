// DO NOT EDIT -- auto-generated from hdl/cpu/riscv_formal/isa/gen.py

module rvfi_instruction_c_or (
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

  // CS-type instruction format (ALU version)
  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;
  wire [5:0] instruction_funct6 = rvfi_instruction[15:10];
  wire [1:0] instruction_funct2 = rvfi_instruction[6:5];
  wire [4:0] instruction_rs1_rd = {1'b1, rvfi_instruction[9:7]};
  wire [4:0] instruction_rs2 = {1'b1, rvfi_instruction[4:2]};
  wire [1:0] instruction_opcode = rvfi_instruction[1:0];

`ifdef RISCV_FORMAL_CSR_MISA
  wire misa_ok = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h 4) == `RISCV_FORMAL_XLEN'h 4;
  assign spec_csr_misa_rmask = `RISCV_FORMAL_XLEN'h 4;
`else
  wire misa_ok = 1;
`endif

  // C_OR instruction
  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata | rvfi_rs2_rdata;
  assign spec_valid = rvfi_valid && !instruction_padding && instruction_funct6 == 6'b 100011 && instruction_funct2 == 2'b 10 && instruction_opcode == 2'b 01;
  assign spec_rs1_addr = instruction_rs1_rd;
  assign spec_rs2_addr = instruction_rs2;
  assign spec_rd_addr = instruction_rs1_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 2;

  // default assignments
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule
