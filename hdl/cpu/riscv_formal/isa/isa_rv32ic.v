// DO NOT EDIT -- auto-generated from hdl/cpu/riscv_formal/isa/gen.py

module rvfi_isa_rv32ic (
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
  wire                                spec_instruction_add_valid;
  wire                                spec_instruction_add_trap;
  wire [                       4 : 0] spec_instruction_add_rs1_addr;
  wire [                       4 : 0] spec_instruction_add_rs2_addr;
  wire [                       4 : 0] spec_instruction_add_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_add_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_add_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_add_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_add_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_add_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_add_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_add_csr_misa_rmask;
`endif

  rvfi_instruction_add add (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_add_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_add_valid),
    .spec_trap(spec_instruction_add_trap),
    .spec_rs1_addr(spec_instruction_add_rs1_addr),
    .spec_rs2_addr(spec_instruction_add_rs2_addr),
    .spec_rd_addr(spec_instruction_add_rd_addr),
    .spec_rd_wdata(spec_instruction_add_rd_wdata),
    .spec_pc_wdata(spec_instruction_add_pc_wdata),
    .spec_mem_addr(spec_instruction_add_mem_addr),
    .spec_mem_rmask(spec_instruction_add_mem_rmask),
    .spec_mem_wmask(spec_instruction_add_mem_wmask),
    .spec_mem_wdata(spec_instruction_add_mem_wdata)
  );

  wire                                spec_instruction_addi_valid;
  wire                                spec_instruction_addi_trap;
  wire [                       4 : 0] spec_instruction_addi_rs1_addr;
  wire [                       4 : 0] spec_instruction_addi_rs2_addr;
  wire [                       4 : 0] spec_instruction_addi_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_addi_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_addi_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_addi_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_addi_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_addi_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_addi_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_addi_csr_misa_rmask;
`endif

  rvfi_instruction_addi addi (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_addi_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_addi_valid),
    .spec_trap(spec_instruction_addi_trap),
    .spec_rs1_addr(spec_instruction_addi_rs1_addr),
    .spec_rs2_addr(spec_instruction_addi_rs2_addr),
    .spec_rd_addr(spec_instruction_addi_rd_addr),
    .spec_rd_wdata(spec_instruction_addi_rd_wdata),
    .spec_pc_wdata(spec_instruction_addi_pc_wdata),
    .spec_mem_addr(spec_instruction_addi_mem_addr),
    .spec_mem_rmask(spec_instruction_addi_mem_rmask),
    .spec_mem_wmask(spec_instruction_addi_mem_wmask),
    .spec_mem_wdata(spec_instruction_addi_mem_wdata)
  );

  wire                                spec_instruction_and_valid;
  wire                                spec_instruction_and_trap;
  wire [                       4 : 0] spec_instruction_and_rs1_addr;
  wire [                       4 : 0] spec_instruction_and_rs2_addr;
  wire [                       4 : 0] spec_instruction_and_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_and_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_and_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_and_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_and_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_and_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_and_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_and_csr_misa_rmask;
`endif

  rvfi_instruction_and and (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_and_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_and_valid),
    .spec_trap(spec_instruction_and_trap),
    .spec_rs1_addr(spec_instruction_and_rs1_addr),
    .spec_rs2_addr(spec_instruction_and_rs2_addr),
    .spec_rd_addr(spec_instruction_and_rd_addr),
    .spec_rd_wdata(spec_instruction_and_rd_wdata),
    .spec_pc_wdata(spec_instruction_and_pc_wdata),
    .spec_mem_addr(spec_instruction_and_mem_addr),
    .spec_mem_rmask(spec_instruction_and_mem_rmask),
    .spec_mem_wmask(spec_instruction_and_mem_wmask),
    .spec_mem_wdata(spec_instruction_and_mem_wdata)
  );

  wire                                spec_instruction_andi_valid;
  wire                                spec_instruction_andi_trap;
  wire [                       4 : 0] spec_instruction_andi_rs1_addr;
  wire [                       4 : 0] spec_instruction_andi_rs2_addr;
  wire [                       4 : 0] spec_instruction_andi_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_andi_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_andi_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_andi_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_andi_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_andi_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_andi_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_andi_csr_misa_rmask;
`endif

  rvfi_instruction_andi andi (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_andi_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_andi_valid),
    .spec_trap(spec_instruction_andi_trap),
    .spec_rs1_addr(spec_instruction_andi_rs1_addr),
    .spec_rs2_addr(spec_instruction_andi_rs2_addr),
    .spec_rd_addr(spec_instruction_andi_rd_addr),
    .spec_rd_wdata(spec_instruction_andi_rd_wdata),
    .spec_pc_wdata(spec_instruction_andi_pc_wdata),
    .spec_mem_addr(spec_instruction_andi_mem_addr),
    .spec_mem_rmask(spec_instruction_andi_mem_rmask),
    .spec_mem_wmask(spec_instruction_andi_mem_wmask),
    .spec_mem_wdata(spec_instruction_andi_mem_wdata)
  );

  wire                                spec_instruction_auipc_valid;
  wire                                spec_instruction_auipc_trap;
  wire [                       4 : 0] spec_instruction_auipc_rs1_addr;
  wire [                       4 : 0] spec_instruction_auipc_rs2_addr;
  wire [                       4 : 0] spec_instruction_auipc_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_auipc_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_auipc_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_auipc_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_auipc_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_auipc_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_auipc_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_auipc_csr_misa_rmask;
`endif

  rvfi_instruction_auipc auipc (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_auipc_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_auipc_valid),
    .spec_trap(spec_instruction_auipc_trap),
    .spec_rs1_addr(spec_instruction_auipc_rs1_addr),
    .spec_rs2_addr(spec_instruction_auipc_rs2_addr),
    .spec_rd_addr(spec_instruction_auipc_rd_addr),
    .spec_rd_wdata(spec_instruction_auipc_rd_wdata),
    .spec_pc_wdata(spec_instruction_auipc_pc_wdata),
    .spec_mem_addr(spec_instruction_auipc_mem_addr),
    .spec_mem_rmask(spec_instruction_auipc_mem_rmask),
    .spec_mem_wmask(spec_instruction_auipc_mem_wmask),
    .spec_mem_wdata(spec_instruction_auipc_mem_wdata)
  );

  wire                                spec_instruction_beq_valid;
  wire                                spec_instruction_beq_trap;
  wire [                       4 : 0] spec_instruction_beq_rs1_addr;
  wire [                       4 : 0] spec_instruction_beq_rs2_addr;
  wire [                       4 : 0] spec_instruction_beq_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_beq_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_beq_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_beq_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_beq_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_beq_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_beq_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_beq_csr_misa_rmask;
`endif

  rvfi_instruction_beq beq (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_beq_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_beq_valid),
    .spec_trap(spec_instruction_beq_trap),
    .spec_rs1_addr(spec_instruction_beq_rs1_addr),
    .spec_rs2_addr(spec_instruction_beq_rs2_addr),
    .spec_rd_addr(spec_instruction_beq_rd_addr),
    .spec_rd_wdata(spec_instruction_beq_rd_wdata),
    .spec_pc_wdata(spec_instruction_beq_pc_wdata),
    .spec_mem_addr(spec_instruction_beq_mem_addr),
    .spec_mem_rmask(spec_instruction_beq_mem_rmask),
    .spec_mem_wmask(spec_instruction_beq_mem_wmask),
    .spec_mem_wdata(spec_instruction_beq_mem_wdata)
  );

  wire                                spec_instruction_bge_valid;
  wire                                spec_instruction_bge_trap;
  wire [                       4 : 0] spec_instruction_bge_rs1_addr;
  wire [                       4 : 0] spec_instruction_bge_rs2_addr;
  wire [                       4 : 0] spec_instruction_bge_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bge_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bge_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bge_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_bge_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_bge_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bge_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bge_csr_misa_rmask;
`endif

  rvfi_instruction_bge bge (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_bge_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_bge_valid),
    .spec_trap(spec_instruction_bge_trap),
    .spec_rs1_addr(spec_instruction_bge_rs1_addr),
    .spec_rs2_addr(spec_instruction_bge_rs2_addr),
    .spec_rd_addr(spec_instruction_bge_rd_addr),
    .spec_rd_wdata(spec_instruction_bge_rd_wdata),
    .spec_pc_wdata(spec_instruction_bge_pc_wdata),
    .spec_mem_addr(spec_instruction_bge_mem_addr),
    .spec_mem_rmask(spec_instruction_bge_mem_rmask),
    .spec_mem_wmask(spec_instruction_bge_mem_wmask),
    .spec_mem_wdata(spec_instruction_bge_mem_wdata)
  );

  wire                                spec_instruction_bgeu_valid;
  wire                                spec_instruction_bgeu_trap;
  wire [                       4 : 0] spec_instruction_bgeu_rs1_addr;
  wire [                       4 : 0] spec_instruction_bgeu_rs2_addr;
  wire [                       4 : 0] spec_instruction_bgeu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bgeu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bgeu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bgeu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_bgeu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_bgeu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bgeu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bgeu_csr_misa_rmask;
`endif

  rvfi_instruction_bgeu bgeu (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_bgeu_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_bgeu_valid),
    .spec_trap(spec_instruction_bgeu_trap),
    .spec_rs1_addr(spec_instruction_bgeu_rs1_addr),
    .spec_rs2_addr(spec_instruction_bgeu_rs2_addr),
    .spec_rd_addr(spec_instruction_bgeu_rd_addr),
    .spec_rd_wdata(spec_instruction_bgeu_rd_wdata),
    .spec_pc_wdata(spec_instruction_bgeu_pc_wdata),
    .spec_mem_addr(spec_instruction_bgeu_mem_addr),
    .spec_mem_rmask(spec_instruction_bgeu_mem_rmask),
    .spec_mem_wmask(spec_instruction_bgeu_mem_wmask),
    .spec_mem_wdata(spec_instruction_bgeu_mem_wdata)
  );

  wire                                spec_instruction_blt_valid;
  wire                                spec_instruction_blt_trap;
  wire [                       4 : 0] spec_instruction_blt_rs1_addr;
  wire [                       4 : 0] spec_instruction_blt_rs2_addr;
  wire [                       4 : 0] spec_instruction_blt_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_blt_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_blt_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_blt_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_blt_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_blt_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_blt_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_blt_csr_misa_rmask;
`endif

  rvfi_instruction_blt blt (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_blt_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_blt_valid),
    .spec_trap(spec_instruction_blt_trap),
    .spec_rs1_addr(spec_instruction_blt_rs1_addr),
    .spec_rs2_addr(spec_instruction_blt_rs2_addr),
    .spec_rd_addr(spec_instruction_blt_rd_addr),
    .spec_rd_wdata(spec_instruction_blt_rd_wdata),
    .spec_pc_wdata(spec_instruction_blt_pc_wdata),
    .spec_mem_addr(spec_instruction_blt_mem_addr),
    .spec_mem_rmask(spec_instruction_blt_mem_rmask),
    .spec_mem_wmask(spec_instruction_blt_mem_wmask),
    .spec_mem_wdata(spec_instruction_blt_mem_wdata)
  );

  wire                                spec_instruction_bltu_valid;
  wire                                spec_instruction_bltu_trap;
  wire [                       4 : 0] spec_instruction_bltu_rs1_addr;
  wire [                       4 : 0] spec_instruction_bltu_rs2_addr;
  wire [                       4 : 0] spec_instruction_bltu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bltu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bltu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bltu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_bltu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_bltu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bltu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bltu_csr_misa_rmask;
`endif

  rvfi_instruction_bltu bltu (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_bltu_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_bltu_valid),
    .spec_trap(spec_instruction_bltu_trap),
    .spec_rs1_addr(spec_instruction_bltu_rs1_addr),
    .spec_rs2_addr(spec_instruction_bltu_rs2_addr),
    .spec_rd_addr(spec_instruction_bltu_rd_addr),
    .spec_rd_wdata(spec_instruction_bltu_rd_wdata),
    .spec_pc_wdata(spec_instruction_bltu_pc_wdata),
    .spec_mem_addr(spec_instruction_bltu_mem_addr),
    .spec_mem_rmask(spec_instruction_bltu_mem_rmask),
    .spec_mem_wmask(spec_instruction_bltu_mem_wmask),
    .spec_mem_wdata(spec_instruction_bltu_mem_wdata)
  );

  wire                                spec_instruction_bne_valid;
  wire                                spec_instruction_bne_trap;
  wire [                       4 : 0] spec_instruction_bne_rs1_addr;
  wire [                       4 : 0] spec_instruction_bne_rs2_addr;
  wire [                       4 : 0] spec_instruction_bne_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bne_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bne_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bne_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_bne_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_bne_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bne_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_bne_csr_misa_rmask;
`endif

  rvfi_instruction_bne bne (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_bne_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_bne_valid),
    .spec_trap(spec_instruction_bne_trap),
    .spec_rs1_addr(spec_instruction_bne_rs1_addr),
    .spec_rs2_addr(spec_instruction_bne_rs2_addr),
    .spec_rd_addr(spec_instruction_bne_rd_addr),
    .spec_rd_wdata(spec_instruction_bne_rd_wdata),
    .spec_pc_wdata(spec_instruction_bne_pc_wdata),
    .spec_mem_addr(spec_instruction_bne_mem_addr),
    .spec_mem_rmask(spec_instruction_bne_mem_rmask),
    .spec_mem_wmask(spec_instruction_bne_mem_wmask),
    .spec_mem_wdata(spec_instruction_bne_mem_wdata)
  );

  wire                                spec_instruction_c_add_valid;
  wire                                spec_instruction_c_add_trap;
  wire [                       4 : 0] spec_instruction_c_add_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_add_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_add_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_add_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_add_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_add_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_add_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_add_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_add_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_add_csr_misa_rmask;
`endif

  rvfi_instruction_c_add c_add (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_add_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_add_valid),
    .spec_trap(spec_instruction_c_add_trap),
    .spec_rs1_addr(spec_instruction_c_add_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_add_rs2_addr),
    .spec_rd_addr(spec_instruction_c_add_rd_addr),
    .spec_rd_wdata(spec_instruction_c_add_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_add_pc_wdata),
    .spec_mem_addr(spec_instruction_c_add_mem_addr),
    .spec_mem_rmask(spec_instruction_c_add_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_add_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_add_mem_wdata)
  );

  wire                                spec_instruction_c_addi_valid;
  wire                                spec_instruction_c_addi_trap;
  wire [                       4 : 0] spec_instruction_c_addi_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_addi_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_addi_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_addi_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_addi_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi_csr_misa_rmask;
`endif

  rvfi_instruction_c_addi c_addi (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_addi_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_addi_valid),
    .spec_trap(spec_instruction_c_addi_trap),
    .spec_rs1_addr(spec_instruction_c_addi_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_addi_rs2_addr),
    .spec_rd_addr(spec_instruction_c_addi_rd_addr),
    .spec_rd_wdata(spec_instruction_c_addi_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_addi_pc_wdata),
    .spec_mem_addr(spec_instruction_c_addi_mem_addr),
    .spec_mem_rmask(spec_instruction_c_addi_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_addi_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_addi_mem_wdata)
  );

  wire                                spec_instruction_c_addi16sp_valid;
  wire                                spec_instruction_c_addi16sp_trap;
  wire [                       4 : 0] spec_instruction_c_addi16sp_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_addi16sp_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_addi16sp_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi16sp_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi16sp_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi16sp_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_addi16sp_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_addi16sp_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi16sp_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi16sp_csr_misa_rmask;
`endif

  rvfi_instruction_c_addi16sp c_addi16sp (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_addi16sp_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_addi16sp_valid),
    .spec_trap(spec_instruction_c_addi16sp_trap),
    .spec_rs1_addr(spec_instruction_c_addi16sp_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_addi16sp_rs2_addr),
    .spec_rd_addr(spec_instruction_c_addi16sp_rd_addr),
    .spec_rd_wdata(spec_instruction_c_addi16sp_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_addi16sp_pc_wdata),
    .spec_mem_addr(spec_instruction_c_addi16sp_mem_addr),
    .spec_mem_rmask(spec_instruction_c_addi16sp_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_addi16sp_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_addi16sp_mem_wdata)
  );

  wire                                spec_instruction_c_addi4spn_valid;
  wire                                spec_instruction_c_addi4spn_trap;
  wire [                       4 : 0] spec_instruction_c_addi4spn_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_addi4spn_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_addi4spn_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi4spn_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi4spn_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi4spn_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_addi4spn_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_addi4spn_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi4spn_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_addi4spn_csr_misa_rmask;
`endif

  rvfi_instruction_c_addi4spn c_addi4spn (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_addi4spn_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_addi4spn_valid),
    .spec_trap(spec_instruction_c_addi4spn_trap),
    .spec_rs1_addr(spec_instruction_c_addi4spn_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_addi4spn_rs2_addr),
    .spec_rd_addr(spec_instruction_c_addi4spn_rd_addr),
    .spec_rd_wdata(spec_instruction_c_addi4spn_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_addi4spn_pc_wdata),
    .spec_mem_addr(spec_instruction_c_addi4spn_mem_addr),
    .spec_mem_rmask(spec_instruction_c_addi4spn_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_addi4spn_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_addi4spn_mem_wdata)
  );

  wire                                spec_instruction_c_and_valid;
  wire                                spec_instruction_c_and_trap;
  wire [                       4 : 0] spec_instruction_c_and_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_and_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_and_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_and_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_and_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_and_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_and_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_and_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_and_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_and_csr_misa_rmask;
`endif

  rvfi_instruction_c_and c_and (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_and_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_and_valid),
    .spec_trap(spec_instruction_c_and_trap),
    .spec_rs1_addr(spec_instruction_c_and_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_and_rs2_addr),
    .spec_rd_addr(spec_instruction_c_and_rd_addr),
    .spec_rd_wdata(spec_instruction_c_and_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_and_pc_wdata),
    .spec_mem_addr(spec_instruction_c_and_mem_addr),
    .spec_mem_rmask(spec_instruction_c_and_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_and_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_and_mem_wdata)
  );

  wire                                spec_instruction_c_andi_valid;
  wire                                spec_instruction_c_andi_trap;
  wire [                       4 : 0] spec_instruction_c_andi_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_andi_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_andi_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_andi_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_andi_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_andi_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_andi_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_andi_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_andi_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_andi_csr_misa_rmask;
`endif

  rvfi_instruction_c_andi c_andi (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_andi_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_andi_valid),
    .spec_trap(spec_instruction_c_andi_trap),
    .spec_rs1_addr(spec_instruction_c_andi_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_andi_rs2_addr),
    .spec_rd_addr(spec_instruction_c_andi_rd_addr),
    .spec_rd_wdata(spec_instruction_c_andi_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_andi_pc_wdata),
    .spec_mem_addr(spec_instruction_c_andi_mem_addr),
    .spec_mem_rmask(spec_instruction_c_andi_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_andi_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_andi_mem_wdata)
  );

  wire                                spec_instruction_c_beqz_valid;
  wire                                spec_instruction_c_beqz_trap;
  wire [                       4 : 0] spec_instruction_c_beqz_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_beqz_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_beqz_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_beqz_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_beqz_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_beqz_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_beqz_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_beqz_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_beqz_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_beqz_csr_misa_rmask;
`endif

  rvfi_instruction_c_beqz c_beqz (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_beqz_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_beqz_valid),
    .spec_trap(spec_instruction_c_beqz_trap),
    .spec_rs1_addr(spec_instruction_c_beqz_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_beqz_rs2_addr),
    .spec_rd_addr(spec_instruction_c_beqz_rd_addr),
    .spec_rd_wdata(spec_instruction_c_beqz_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_beqz_pc_wdata),
    .spec_mem_addr(spec_instruction_c_beqz_mem_addr),
    .spec_mem_rmask(spec_instruction_c_beqz_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_beqz_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_beqz_mem_wdata)
  );

  wire                                spec_instruction_c_bnez_valid;
  wire                                spec_instruction_c_bnez_trap;
  wire [                       4 : 0] spec_instruction_c_bnez_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_bnez_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_bnez_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_bnez_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_bnez_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_bnez_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_bnez_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_bnez_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_bnez_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_bnez_csr_misa_rmask;
`endif

  rvfi_instruction_c_bnez c_bnez (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_bnez_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_bnez_valid),
    .spec_trap(spec_instruction_c_bnez_trap),
    .spec_rs1_addr(spec_instruction_c_bnez_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_bnez_rs2_addr),
    .spec_rd_addr(spec_instruction_c_bnez_rd_addr),
    .spec_rd_wdata(spec_instruction_c_bnez_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_bnez_pc_wdata),
    .spec_mem_addr(spec_instruction_c_bnez_mem_addr),
    .spec_mem_rmask(spec_instruction_c_bnez_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_bnez_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_bnez_mem_wdata)
  );

  wire                                spec_instruction_c_j_valid;
  wire                                spec_instruction_c_j_trap;
  wire [                       4 : 0] spec_instruction_c_j_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_j_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_j_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_j_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_j_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_j_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_j_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_j_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_j_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_j_csr_misa_rmask;
`endif

  rvfi_instruction_c_j c_j (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_j_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_j_valid),
    .spec_trap(spec_instruction_c_j_trap),
    .spec_rs1_addr(spec_instruction_c_j_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_j_rs2_addr),
    .spec_rd_addr(spec_instruction_c_j_rd_addr),
    .spec_rd_wdata(spec_instruction_c_j_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_j_pc_wdata),
    .spec_mem_addr(spec_instruction_c_j_mem_addr),
    .spec_mem_rmask(spec_instruction_c_j_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_j_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_j_mem_wdata)
  );

  wire                                spec_instruction_c_jal_valid;
  wire                                spec_instruction_c_jal_trap;
  wire [                       4 : 0] spec_instruction_c_jal_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_jal_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_jal_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jal_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jal_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jal_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_jal_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_jal_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jal_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jal_csr_misa_rmask;
`endif

  rvfi_instruction_c_jal c_jal (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_jal_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_jal_valid),
    .spec_trap(spec_instruction_c_jal_trap),
    .spec_rs1_addr(spec_instruction_c_jal_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_jal_rs2_addr),
    .spec_rd_addr(spec_instruction_c_jal_rd_addr),
    .spec_rd_wdata(spec_instruction_c_jal_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_jal_pc_wdata),
    .spec_mem_addr(spec_instruction_c_jal_mem_addr),
    .spec_mem_rmask(spec_instruction_c_jal_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_jal_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_jal_mem_wdata)
  );

  wire                                spec_instruction_c_jalr_valid;
  wire                                spec_instruction_c_jalr_trap;
  wire [                       4 : 0] spec_instruction_c_jalr_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_jalr_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_jalr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jalr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jalr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jalr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_jalr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_jalr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jalr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jalr_csr_misa_rmask;
`endif

  rvfi_instruction_c_jalr c_jalr (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_jalr_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_jalr_valid),
    .spec_trap(spec_instruction_c_jalr_trap),
    .spec_rs1_addr(spec_instruction_c_jalr_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_jalr_rs2_addr),
    .spec_rd_addr(spec_instruction_c_jalr_rd_addr),
    .spec_rd_wdata(spec_instruction_c_jalr_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_jalr_pc_wdata),
    .spec_mem_addr(spec_instruction_c_jalr_mem_addr),
    .spec_mem_rmask(spec_instruction_c_jalr_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_jalr_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_jalr_mem_wdata)
  );

  wire                                spec_instruction_c_jr_valid;
  wire                                spec_instruction_c_jr_trap;
  wire [                       4 : 0] spec_instruction_c_jr_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_jr_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_jr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_jr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_jr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_jr_csr_misa_rmask;
`endif

  rvfi_instruction_c_jr c_jr (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_jr_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_jr_valid),
    .spec_trap(spec_instruction_c_jr_trap),
    .spec_rs1_addr(spec_instruction_c_jr_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_jr_rs2_addr),
    .spec_rd_addr(spec_instruction_c_jr_rd_addr),
    .spec_rd_wdata(spec_instruction_c_jr_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_jr_pc_wdata),
    .spec_mem_addr(spec_instruction_c_jr_mem_addr),
    .spec_mem_rmask(spec_instruction_c_jr_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_jr_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_jr_mem_wdata)
  );

  wire                                spec_instruction_c_li_valid;
  wire                                spec_instruction_c_li_trap;
  wire [                       4 : 0] spec_instruction_c_li_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_li_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_li_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_li_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_li_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_li_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_li_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_li_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_li_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_li_csr_misa_rmask;
`endif

  rvfi_instruction_c_li c_li (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_li_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_li_valid),
    .spec_trap(spec_instruction_c_li_trap),
    .spec_rs1_addr(spec_instruction_c_li_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_li_rs2_addr),
    .spec_rd_addr(spec_instruction_c_li_rd_addr),
    .spec_rd_wdata(spec_instruction_c_li_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_li_pc_wdata),
    .spec_mem_addr(spec_instruction_c_li_mem_addr),
    .spec_mem_rmask(spec_instruction_c_li_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_li_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_li_mem_wdata)
  );

  wire                                spec_instruction_c_lui_valid;
  wire                                spec_instruction_c_lui_trap;
  wire [                       4 : 0] spec_instruction_c_lui_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_lui_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_lui_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lui_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lui_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lui_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_lui_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_lui_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lui_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lui_csr_misa_rmask;
`endif

  rvfi_instruction_c_lui c_lui (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_lui_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_lui_valid),
    .spec_trap(spec_instruction_c_lui_trap),
    .spec_rs1_addr(spec_instruction_c_lui_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_lui_rs2_addr),
    .spec_rd_addr(spec_instruction_c_lui_rd_addr),
    .spec_rd_wdata(spec_instruction_c_lui_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_lui_pc_wdata),
    .spec_mem_addr(spec_instruction_c_lui_mem_addr),
    .spec_mem_rmask(spec_instruction_c_lui_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_lui_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_lui_mem_wdata)
  );

  wire                                spec_instruction_c_lw_valid;
  wire                                spec_instruction_c_lw_trap;
  wire [                       4 : 0] spec_instruction_c_lw_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_lw_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_lw_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lw_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lw_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lw_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_lw_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_lw_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lw_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lw_csr_misa_rmask;
`endif

  rvfi_instruction_c_lw c_lw (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_lw_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_lw_valid),
    .spec_trap(spec_instruction_c_lw_trap),
    .spec_rs1_addr(spec_instruction_c_lw_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_lw_rs2_addr),
    .spec_rd_addr(spec_instruction_c_lw_rd_addr),
    .spec_rd_wdata(spec_instruction_c_lw_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_lw_pc_wdata),
    .spec_mem_addr(spec_instruction_c_lw_mem_addr),
    .spec_mem_rmask(spec_instruction_c_lw_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_lw_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_lw_mem_wdata)
  );

  wire                                spec_instruction_c_lwsp_valid;
  wire                                spec_instruction_c_lwsp_trap;
  wire [                       4 : 0] spec_instruction_c_lwsp_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_lwsp_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_lwsp_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lwsp_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lwsp_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lwsp_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_lwsp_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_lwsp_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lwsp_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_lwsp_csr_misa_rmask;
`endif

  rvfi_instruction_c_lwsp c_lwsp (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_lwsp_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_lwsp_valid),
    .spec_trap(spec_instruction_c_lwsp_trap),
    .spec_rs1_addr(spec_instruction_c_lwsp_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_lwsp_rs2_addr),
    .spec_rd_addr(spec_instruction_c_lwsp_rd_addr),
    .spec_rd_wdata(spec_instruction_c_lwsp_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_lwsp_pc_wdata),
    .spec_mem_addr(spec_instruction_c_lwsp_mem_addr),
    .spec_mem_rmask(spec_instruction_c_lwsp_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_lwsp_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_lwsp_mem_wdata)
  );

  wire                                spec_instruction_c_mv_valid;
  wire                                spec_instruction_c_mv_trap;
  wire [                       4 : 0] spec_instruction_c_mv_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_mv_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_mv_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_mv_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_mv_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_mv_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_mv_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_mv_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_mv_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_mv_csr_misa_rmask;
`endif

  rvfi_instruction_c_mv c_mv (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_mv_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_mv_valid),
    .spec_trap(spec_instruction_c_mv_trap),
    .spec_rs1_addr(spec_instruction_c_mv_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_mv_rs2_addr),
    .spec_rd_addr(spec_instruction_c_mv_rd_addr),
    .spec_rd_wdata(spec_instruction_c_mv_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_mv_pc_wdata),
    .spec_mem_addr(spec_instruction_c_mv_mem_addr),
    .spec_mem_rmask(spec_instruction_c_mv_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_mv_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_mv_mem_wdata)
  );

  wire                                spec_instruction_c_or_valid;
  wire                                spec_instruction_c_or_trap;
  wire [                       4 : 0] spec_instruction_c_or_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_or_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_or_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_or_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_or_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_or_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_or_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_or_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_or_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_or_csr_misa_rmask;
`endif

  rvfi_instruction_c_or c_or (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_or_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_or_valid),
    .spec_trap(spec_instruction_c_or_trap),
    .spec_rs1_addr(spec_instruction_c_or_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_or_rs2_addr),
    .spec_rd_addr(spec_instruction_c_or_rd_addr),
    .spec_rd_wdata(spec_instruction_c_or_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_or_pc_wdata),
    .spec_mem_addr(spec_instruction_c_or_mem_addr),
    .spec_mem_rmask(spec_instruction_c_or_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_or_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_or_mem_wdata)
  );

  wire                                spec_instruction_c_slli_valid;
  wire                                spec_instruction_c_slli_trap;
  wire [                       4 : 0] spec_instruction_c_slli_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_slli_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_slli_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_slli_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_slli_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_slli_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_slli_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_slli_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_slli_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_slli_csr_misa_rmask;
`endif

  rvfi_instruction_c_slli c_slli (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_slli_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_slli_valid),
    .spec_trap(spec_instruction_c_slli_trap),
    .spec_rs1_addr(spec_instruction_c_slli_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_slli_rs2_addr),
    .spec_rd_addr(spec_instruction_c_slli_rd_addr),
    .spec_rd_wdata(spec_instruction_c_slli_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_slli_pc_wdata),
    .spec_mem_addr(spec_instruction_c_slli_mem_addr),
    .spec_mem_rmask(spec_instruction_c_slli_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_slli_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_slli_mem_wdata)
  );

  wire                                spec_instruction_c_srai_valid;
  wire                                spec_instruction_c_srai_trap;
  wire [                       4 : 0] spec_instruction_c_srai_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_srai_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_srai_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srai_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srai_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srai_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_srai_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_srai_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srai_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srai_csr_misa_rmask;
`endif

  rvfi_instruction_c_srai c_srai (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_srai_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_srai_valid),
    .spec_trap(spec_instruction_c_srai_trap),
    .spec_rs1_addr(spec_instruction_c_srai_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_srai_rs2_addr),
    .spec_rd_addr(spec_instruction_c_srai_rd_addr),
    .spec_rd_wdata(spec_instruction_c_srai_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_srai_pc_wdata),
    .spec_mem_addr(spec_instruction_c_srai_mem_addr),
    .spec_mem_rmask(spec_instruction_c_srai_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_srai_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_srai_mem_wdata)
  );

  wire                                spec_instruction_c_srli_valid;
  wire                                spec_instruction_c_srli_trap;
  wire [                       4 : 0] spec_instruction_c_srli_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_srli_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_srli_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srli_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srli_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srli_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_srli_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_srli_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srli_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_srli_csr_misa_rmask;
`endif

  rvfi_instruction_c_srli c_srli (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_srli_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_srli_valid),
    .spec_trap(spec_instruction_c_srli_trap),
    .spec_rs1_addr(spec_instruction_c_srli_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_srli_rs2_addr),
    .spec_rd_addr(spec_instruction_c_srli_rd_addr),
    .spec_rd_wdata(spec_instruction_c_srli_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_srli_pc_wdata),
    .spec_mem_addr(spec_instruction_c_srli_mem_addr),
    .spec_mem_rmask(spec_instruction_c_srli_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_srli_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_srli_mem_wdata)
  );

  wire                                spec_instruction_c_sub_valid;
  wire                                spec_instruction_c_sub_trap;
  wire [                       4 : 0] spec_instruction_c_sub_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_sub_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_sub_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sub_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sub_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sub_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_sub_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_sub_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sub_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sub_csr_misa_rmask;
`endif

  rvfi_instruction_c_sub c_sub (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_sub_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_sub_valid),
    .spec_trap(spec_instruction_c_sub_trap),
    .spec_rs1_addr(spec_instruction_c_sub_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_sub_rs2_addr),
    .spec_rd_addr(spec_instruction_c_sub_rd_addr),
    .spec_rd_wdata(spec_instruction_c_sub_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_sub_pc_wdata),
    .spec_mem_addr(spec_instruction_c_sub_mem_addr),
    .spec_mem_rmask(spec_instruction_c_sub_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_sub_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_sub_mem_wdata)
  );

  wire                                spec_instruction_c_sw_valid;
  wire                                spec_instruction_c_sw_trap;
  wire [                       4 : 0] spec_instruction_c_sw_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_sw_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_sw_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sw_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sw_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sw_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_sw_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_sw_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sw_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_sw_csr_misa_rmask;
`endif

  rvfi_instruction_c_sw c_sw (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_sw_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_sw_valid),
    .spec_trap(spec_instruction_c_sw_trap),
    .spec_rs1_addr(spec_instruction_c_sw_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_sw_rs2_addr),
    .spec_rd_addr(spec_instruction_c_sw_rd_addr),
    .spec_rd_wdata(spec_instruction_c_sw_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_sw_pc_wdata),
    .spec_mem_addr(spec_instruction_c_sw_mem_addr),
    .spec_mem_rmask(spec_instruction_c_sw_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_sw_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_sw_mem_wdata)
  );

  wire                                spec_instruction_c_swsp_valid;
  wire                                spec_instruction_c_swsp_trap;
  wire [                       4 : 0] spec_instruction_c_swsp_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_swsp_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_swsp_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_swsp_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_swsp_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_swsp_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_swsp_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_swsp_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_swsp_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_swsp_csr_misa_rmask;
`endif

  rvfi_instruction_c_swsp c_swsp (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_swsp_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_swsp_valid),
    .spec_trap(spec_instruction_c_swsp_trap),
    .spec_rs1_addr(spec_instruction_c_swsp_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_swsp_rs2_addr),
    .spec_rd_addr(spec_instruction_c_swsp_rd_addr),
    .spec_rd_wdata(spec_instruction_c_swsp_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_swsp_pc_wdata),
    .spec_mem_addr(spec_instruction_c_swsp_mem_addr),
    .spec_mem_rmask(spec_instruction_c_swsp_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_swsp_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_swsp_mem_wdata)
  );

  wire                                spec_instruction_c_xor_valid;
  wire                                spec_instruction_c_xor_trap;
  wire [                       4 : 0] spec_instruction_c_xor_rs1_addr;
  wire [                       4 : 0] spec_instruction_c_xor_rs2_addr;
  wire [                       4 : 0] spec_instruction_c_xor_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_xor_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_xor_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_xor_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_xor_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_c_xor_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_xor_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_c_xor_csr_misa_rmask;
`endif

  rvfi_instruction_c_xor c_xor (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_c_xor_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_c_xor_valid),
    .spec_trap(spec_instruction_c_xor_trap),
    .spec_rs1_addr(spec_instruction_c_xor_rs1_addr),
    .spec_rs2_addr(spec_instruction_c_xor_rs2_addr),
    .spec_rd_addr(spec_instruction_c_xor_rd_addr),
    .spec_rd_wdata(spec_instruction_c_xor_rd_wdata),
    .spec_pc_wdata(spec_instruction_c_xor_pc_wdata),
    .spec_mem_addr(spec_instruction_c_xor_mem_addr),
    .spec_mem_rmask(spec_instruction_c_xor_mem_rmask),
    .spec_mem_wmask(spec_instruction_c_xor_mem_wmask),
    .spec_mem_wdata(spec_instruction_c_xor_mem_wdata)
  );

  wire                                spec_instruction_jal_valid;
  wire                                spec_instruction_jal_trap;
  wire [                       4 : 0] spec_instruction_jal_rs1_addr;
  wire [                       4 : 0] spec_instruction_jal_rs2_addr;
  wire [                       4 : 0] spec_instruction_jal_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jal_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jal_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jal_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_jal_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_jal_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jal_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jal_csr_misa_rmask;
`endif

  rvfi_instruction_jal jal (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_jal_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_jal_valid),
    .spec_trap(spec_instruction_jal_trap),
    .spec_rs1_addr(spec_instruction_jal_rs1_addr),
    .spec_rs2_addr(spec_instruction_jal_rs2_addr),
    .spec_rd_addr(spec_instruction_jal_rd_addr),
    .spec_rd_wdata(spec_instruction_jal_rd_wdata),
    .spec_pc_wdata(spec_instruction_jal_pc_wdata),
    .spec_mem_addr(spec_instruction_jal_mem_addr),
    .spec_mem_rmask(spec_instruction_jal_mem_rmask),
    .spec_mem_wmask(spec_instruction_jal_mem_wmask),
    .spec_mem_wdata(spec_instruction_jal_mem_wdata)
  );

  wire                                spec_instruction_jalr_valid;
  wire                                spec_instruction_jalr_trap;
  wire [                       4 : 0] spec_instruction_jalr_rs1_addr;
  wire [                       4 : 0] spec_instruction_jalr_rs2_addr;
  wire [                       4 : 0] spec_instruction_jalr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jalr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jalr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jalr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_jalr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_jalr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jalr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_jalr_csr_misa_rmask;
`endif

  rvfi_instruction_jalr jalr (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_jalr_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_jalr_valid),
    .spec_trap(spec_instruction_jalr_trap),
    .spec_rs1_addr(spec_instruction_jalr_rs1_addr),
    .spec_rs2_addr(spec_instruction_jalr_rs2_addr),
    .spec_rd_addr(spec_instruction_jalr_rd_addr),
    .spec_rd_wdata(spec_instruction_jalr_rd_wdata),
    .spec_pc_wdata(spec_instruction_jalr_pc_wdata),
    .spec_mem_addr(spec_instruction_jalr_mem_addr),
    .spec_mem_rmask(spec_instruction_jalr_mem_rmask),
    .spec_mem_wmask(spec_instruction_jalr_mem_wmask),
    .spec_mem_wdata(spec_instruction_jalr_mem_wdata)
  );

  wire                                spec_instruction_lb_valid;
  wire                                spec_instruction_lb_trap;
  wire [                       4 : 0] spec_instruction_lb_rs1_addr;
  wire [                       4 : 0] spec_instruction_lb_rs2_addr;
  wire [                       4 : 0] spec_instruction_lb_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lb_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lb_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lb_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lb_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lb_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lb_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lb_csr_misa_rmask;
`endif

  rvfi_instruction_lb lb (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_lb_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_lb_valid),
    .spec_trap(spec_instruction_lb_trap),
    .spec_rs1_addr(spec_instruction_lb_rs1_addr),
    .spec_rs2_addr(spec_instruction_lb_rs2_addr),
    .spec_rd_addr(spec_instruction_lb_rd_addr),
    .spec_rd_wdata(spec_instruction_lb_rd_wdata),
    .spec_pc_wdata(spec_instruction_lb_pc_wdata),
    .spec_mem_addr(spec_instruction_lb_mem_addr),
    .spec_mem_rmask(spec_instruction_lb_mem_rmask),
    .spec_mem_wmask(spec_instruction_lb_mem_wmask),
    .spec_mem_wdata(spec_instruction_lb_mem_wdata)
  );

  wire                                spec_instruction_lbu_valid;
  wire                                spec_instruction_lbu_trap;
  wire [                       4 : 0] spec_instruction_lbu_rs1_addr;
  wire [                       4 : 0] spec_instruction_lbu_rs2_addr;
  wire [                       4 : 0] spec_instruction_lbu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lbu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lbu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lbu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lbu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lbu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lbu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lbu_csr_misa_rmask;
`endif

  rvfi_instruction_lbu lbu (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_lbu_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_lbu_valid),
    .spec_trap(spec_instruction_lbu_trap),
    .spec_rs1_addr(spec_instruction_lbu_rs1_addr),
    .spec_rs2_addr(spec_instruction_lbu_rs2_addr),
    .spec_rd_addr(spec_instruction_lbu_rd_addr),
    .spec_rd_wdata(spec_instruction_lbu_rd_wdata),
    .spec_pc_wdata(spec_instruction_lbu_pc_wdata),
    .spec_mem_addr(spec_instruction_lbu_mem_addr),
    .spec_mem_rmask(spec_instruction_lbu_mem_rmask),
    .spec_mem_wmask(spec_instruction_lbu_mem_wmask),
    .spec_mem_wdata(spec_instruction_lbu_mem_wdata)
  );

  wire                                spec_instruction_lh_valid;
  wire                                spec_instruction_lh_trap;
  wire [                       4 : 0] spec_instruction_lh_rs1_addr;
  wire [                       4 : 0] spec_instruction_lh_rs2_addr;
  wire [                       4 : 0] spec_instruction_lh_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lh_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lh_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lh_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lh_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lh_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lh_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lh_csr_misa_rmask;
`endif

  rvfi_instruction_lh lh (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_lh_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_lh_valid),
    .spec_trap(spec_instruction_lh_trap),
    .spec_rs1_addr(spec_instruction_lh_rs1_addr),
    .spec_rs2_addr(spec_instruction_lh_rs2_addr),
    .spec_rd_addr(spec_instruction_lh_rd_addr),
    .spec_rd_wdata(spec_instruction_lh_rd_wdata),
    .spec_pc_wdata(spec_instruction_lh_pc_wdata),
    .spec_mem_addr(spec_instruction_lh_mem_addr),
    .spec_mem_rmask(spec_instruction_lh_mem_rmask),
    .spec_mem_wmask(spec_instruction_lh_mem_wmask),
    .spec_mem_wdata(spec_instruction_lh_mem_wdata)
  );

  wire                                spec_instruction_lhu_valid;
  wire                                spec_instruction_lhu_trap;
  wire [                       4 : 0] spec_instruction_lhu_rs1_addr;
  wire [                       4 : 0] spec_instruction_lhu_rs2_addr;
  wire [                       4 : 0] spec_instruction_lhu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lhu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lhu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lhu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lhu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lhu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lhu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lhu_csr_misa_rmask;
`endif

  rvfi_instruction_lhu lhu (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_lhu_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_lhu_valid),
    .spec_trap(spec_instruction_lhu_trap),
    .spec_rs1_addr(spec_instruction_lhu_rs1_addr),
    .spec_rs2_addr(spec_instruction_lhu_rs2_addr),
    .spec_rd_addr(spec_instruction_lhu_rd_addr),
    .spec_rd_wdata(spec_instruction_lhu_rd_wdata),
    .spec_pc_wdata(spec_instruction_lhu_pc_wdata),
    .spec_mem_addr(spec_instruction_lhu_mem_addr),
    .spec_mem_rmask(spec_instruction_lhu_mem_rmask),
    .spec_mem_wmask(spec_instruction_lhu_mem_wmask),
    .spec_mem_wdata(spec_instruction_lhu_mem_wdata)
  );

  wire                                spec_instruction_lui_valid;
  wire                                spec_instruction_lui_trap;
  wire [                       4 : 0] spec_instruction_lui_rs1_addr;
  wire [                       4 : 0] spec_instruction_lui_rs2_addr;
  wire [                       4 : 0] spec_instruction_lui_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lui_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lui_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lui_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lui_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lui_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lui_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lui_csr_misa_rmask;
`endif

  rvfi_instruction_lui lui (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_lui_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_lui_valid),
    .spec_trap(spec_instruction_lui_trap),
    .spec_rs1_addr(spec_instruction_lui_rs1_addr),
    .spec_rs2_addr(spec_instruction_lui_rs2_addr),
    .spec_rd_addr(spec_instruction_lui_rd_addr),
    .spec_rd_wdata(spec_instruction_lui_rd_wdata),
    .spec_pc_wdata(spec_instruction_lui_pc_wdata),
    .spec_mem_addr(spec_instruction_lui_mem_addr),
    .spec_mem_rmask(spec_instruction_lui_mem_rmask),
    .spec_mem_wmask(spec_instruction_lui_mem_wmask),
    .spec_mem_wdata(spec_instruction_lui_mem_wdata)
  );

  wire                                spec_instruction_lw_valid;
  wire                                spec_instruction_lw_trap;
  wire [                       4 : 0] spec_instruction_lw_rs1_addr;
  wire [                       4 : 0] spec_instruction_lw_rs2_addr;
  wire [                       4 : 0] spec_instruction_lw_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lw_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lw_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lw_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lw_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_lw_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lw_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_lw_csr_misa_rmask;
`endif

  rvfi_instruction_lw lw (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_lw_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_lw_valid),
    .spec_trap(spec_instruction_lw_trap),
    .spec_rs1_addr(spec_instruction_lw_rs1_addr),
    .spec_rs2_addr(spec_instruction_lw_rs2_addr),
    .spec_rd_addr(spec_instruction_lw_rd_addr),
    .spec_rd_wdata(spec_instruction_lw_rd_wdata),
    .spec_pc_wdata(spec_instruction_lw_pc_wdata),
    .spec_mem_addr(spec_instruction_lw_mem_addr),
    .spec_mem_rmask(spec_instruction_lw_mem_rmask),
    .spec_mem_wmask(spec_instruction_lw_mem_wmask),
    .spec_mem_wdata(spec_instruction_lw_mem_wdata)
  );

  wire                                spec_instruction_or_valid;
  wire                                spec_instruction_or_trap;
  wire [                       4 : 0] spec_instruction_or_rs1_addr;
  wire [                       4 : 0] spec_instruction_or_rs2_addr;
  wire [                       4 : 0] spec_instruction_or_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_or_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_or_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_or_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_or_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_or_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_or_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_or_csr_misa_rmask;
`endif

  rvfi_instruction_or or (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_or_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_or_valid),
    .spec_trap(spec_instruction_or_trap),
    .spec_rs1_addr(spec_instruction_or_rs1_addr),
    .spec_rs2_addr(spec_instruction_or_rs2_addr),
    .spec_rd_addr(spec_instruction_or_rd_addr),
    .spec_rd_wdata(spec_instruction_or_rd_wdata),
    .spec_pc_wdata(spec_instruction_or_pc_wdata),
    .spec_mem_addr(spec_instruction_or_mem_addr),
    .spec_mem_rmask(spec_instruction_or_mem_rmask),
    .spec_mem_wmask(spec_instruction_or_mem_wmask),
    .spec_mem_wdata(spec_instruction_or_mem_wdata)
  );

  wire                                spec_instruction_ori_valid;
  wire                                spec_instruction_ori_trap;
  wire [                       4 : 0] spec_instruction_ori_rs1_addr;
  wire [                       4 : 0] spec_instruction_ori_rs2_addr;
  wire [                       4 : 0] spec_instruction_ori_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_ori_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_ori_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_ori_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_ori_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_ori_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_ori_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_ori_csr_misa_rmask;
`endif

  rvfi_instruction_ori ori (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_ori_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_ori_valid),
    .spec_trap(spec_instruction_ori_trap),
    .spec_rs1_addr(spec_instruction_ori_rs1_addr),
    .spec_rs2_addr(spec_instruction_ori_rs2_addr),
    .spec_rd_addr(spec_instruction_ori_rd_addr),
    .spec_rd_wdata(spec_instruction_ori_rd_wdata),
    .spec_pc_wdata(spec_instruction_ori_pc_wdata),
    .spec_mem_addr(spec_instruction_ori_mem_addr),
    .spec_mem_rmask(spec_instruction_ori_mem_rmask),
    .spec_mem_wmask(spec_instruction_ori_mem_wmask),
    .spec_mem_wdata(spec_instruction_ori_mem_wdata)
  );

  wire                                spec_instruction_sb_valid;
  wire                                spec_instruction_sb_trap;
  wire [                       4 : 0] spec_instruction_sb_rs1_addr;
  wire [                       4 : 0] spec_instruction_sb_rs2_addr;
  wire [                       4 : 0] spec_instruction_sb_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sb_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sb_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sb_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sb_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sb_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sb_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sb_csr_misa_rmask;
`endif

  rvfi_instruction_sb sb (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_sb_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_sb_valid),
    .spec_trap(spec_instruction_sb_trap),
    .spec_rs1_addr(spec_instruction_sb_rs1_addr),
    .spec_rs2_addr(spec_instruction_sb_rs2_addr),
    .spec_rd_addr(spec_instruction_sb_rd_addr),
    .spec_rd_wdata(spec_instruction_sb_rd_wdata),
    .spec_pc_wdata(spec_instruction_sb_pc_wdata),
    .spec_mem_addr(spec_instruction_sb_mem_addr),
    .spec_mem_rmask(spec_instruction_sb_mem_rmask),
    .spec_mem_wmask(spec_instruction_sb_mem_wmask),
    .spec_mem_wdata(spec_instruction_sb_mem_wdata)
  );

  wire                                spec_instruction_sh_valid;
  wire                                spec_instruction_sh_trap;
  wire [                       4 : 0] spec_instruction_sh_rs1_addr;
  wire [                       4 : 0] spec_instruction_sh_rs2_addr;
  wire [                       4 : 0] spec_instruction_sh_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sh_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sh_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sh_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sh_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sh_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sh_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sh_csr_misa_rmask;
`endif

  rvfi_instruction_sh sh (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_sh_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_sh_valid),
    .spec_trap(spec_instruction_sh_trap),
    .spec_rs1_addr(spec_instruction_sh_rs1_addr),
    .spec_rs2_addr(spec_instruction_sh_rs2_addr),
    .spec_rd_addr(spec_instruction_sh_rd_addr),
    .spec_rd_wdata(spec_instruction_sh_rd_wdata),
    .spec_pc_wdata(spec_instruction_sh_pc_wdata),
    .spec_mem_addr(spec_instruction_sh_mem_addr),
    .spec_mem_rmask(spec_instruction_sh_mem_rmask),
    .spec_mem_wmask(spec_instruction_sh_mem_wmask),
    .spec_mem_wdata(spec_instruction_sh_mem_wdata)
  );

  wire                                spec_instruction_sll_valid;
  wire                                spec_instruction_sll_trap;
  wire [                       4 : 0] spec_instruction_sll_rs1_addr;
  wire [                       4 : 0] spec_instruction_sll_rs2_addr;
  wire [                       4 : 0] spec_instruction_sll_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sll_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sll_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sll_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sll_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sll_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sll_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sll_csr_misa_rmask;
`endif

  rvfi_instruction_sll sll (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_sll_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_sll_valid),
    .spec_trap(spec_instruction_sll_trap),
    .spec_rs1_addr(spec_instruction_sll_rs1_addr),
    .spec_rs2_addr(spec_instruction_sll_rs2_addr),
    .spec_rd_addr(spec_instruction_sll_rd_addr),
    .spec_rd_wdata(spec_instruction_sll_rd_wdata),
    .spec_pc_wdata(spec_instruction_sll_pc_wdata),
    .spec_mem_addr(spec_instruction_sll_mem_addr),
    .spec_mem_rmask(spec_instruction_sll_mem_rmask),
    .spec_mem_wmask(spec_instruction_sll_mem_wmask),
    .spec_mem_wdata(spec_instruction_sll_mem_wdata)
  );

  wire                                spec_instruction_slli_valid;
  wire                                spec_instruction_slli_trap;
  wire [                       4 : 0] spec_instruction_slli_rs1_addr;
  wire [                       4 : 0] spec_instruction_slli_rs2_addr;
  wire [                       4 : 0] spec_instruction_slli_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slli_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slli_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slli_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_slli_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_slli_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slli_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slli_csr_misa_rmask;
`endif

  rvfi_instruction_slli slli (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_slli_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_slli_valid),
    .spec_trap(spec_instruction_slli_trap),
    .spec_rs1_addr(spec_instruction_slli_rs1_addr),
    .spec_rs2_addr(spec_instruction_slli_rs2_addr),
    .spec_rd_addr(spec_instruction_slli_rd_addr),
    .spec_rd_wdata(spec_instruction_slli_rd_wdata),
    .spec_pc_wdata(spec_instruction_slli_pc_wdata),
    .spec_mem_addr(spec_instruction_slli_mem_addr),
    .spec_mem_rmask(spec_instruction_slli_mem_rmask),
    .spec_mem_wmask(spec_instruction_slli_mem_wmask),
    .spec_mem_wdata(spec_instruction_slli_mem_wdata)
  );

  wire                                spec_instruction_slt_valid;
  wire                                spec_instruction_slt_trap;
  wire [                       4 : 0] spec_instruction_slt_rs1_addr;
  wire [                       4 : 0] spec_instruction_slt_rs2_addr;
  wire [                       4 : 0] spec_instruction_slt_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slt_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slt_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slt_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_slt_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_slt_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slt_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slt_csr_misa_rmask;
`endif

  rvfi_instruction_slt slt (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_slt_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_slt_valid),
    .spec_trap(spec_instruction_slt_trap),
    .spec_rs1_addr(spec_instruction_slt_rs1_addr),
    .spec_rs2_addr(spec_instruction_slt_rs2_addr),
    .spec_rd_addr(spec_instruction_slt_rd_addr),
    .spec_rd_wdata(spec_instruction_slt_rd_wdata),
    .spec_pc_wdata(spec_instruction_slt_pc_wdata),
    .spec_mem_addr(spec_instruction_slt_mem_addr),
    .spec_mem_rmask(spec_instruction_slt_mem_rmask),
    .spec_mem_wmask(spec_instruction_slt_mem_wmask),
    .spec_mem_wdata(spec_instruction_slt_mem_wdata)
  );

  wire                                spec_instruction_slti_valid;
  wire                                spec_instruction_slti_trap;
  wire [                       4 : 0] spec_instruction_slti_rs1_addr;
  wire [                       4 : 0] spec_instruction_slti_rs2_addr;
  wire [                       4 : 0] spec_instruction_slti_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slti_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slti_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slti_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_slti_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_slti_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slti_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_slti_csr_misa_rmask;
`endif

  rvfi_instruction_slti slti (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_slti_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_slti_valid),
    .spec_trap(spec_instruction_slti_trap),
    .spec_rs1_addr(spec_instruction_slti_rs1_addr),
    .spec_rs2_addr(spec_instruction_slti_rs2_addr),
    .spec_rd_addr(spec_instruction_slti_rd_addr),
    .spec_rd_wdata(spec_instruction_slti_rd_wdata),
    .spec_pc_wdata(spec_instruction_slti_pc_wdata),
    .spec_mem_addr(spec_instruction_slti_mem_addr),
    .spec_mem_rmask(spec_instruction_slti_mem_rmask),
    .spec_mem_wmask(spec_instruction_slti_mem_wmask),
    .spec_mem_wdata(spec_instruction_slti_mem_wdata)
  );

  wire                                spec_instruction_sltiu_valid;
  wire                                spec_instruction_sltiu_trap;
  wire [                       4 : 0] spec_instruction_sltiu_rs1_addr;
  wire [                       4 : 0] spec_instruction_sltiu_rs2_addr;
  wire [                       4 : 0] spec_instruction_sltiu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltiu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltiu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltiu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sltiu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sltiu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltiu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltiu_csr_misa_rmask;
`endif

  rvfi_instruction_sltiu sltiu (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_sltiu_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_sltiu_valid),
    .spec_trap(spec_instruction_sltiu_trap),
    .spec_rs1_addr(spec_instruction_sltiu_rs1_addr),
    .spec_rs2_addr(spec_instruction_sltiu_rs2_addr),
    .spec_rd_addr(spec_instruction_sltiu_rd_addr),
    .spec_rd_wdata(spec_instruction_sltiu_rd_wdata),
    .spec_pc_wdata(spec_instruction_sltiu_pc_wdata),
    .spec_mem_addr(spec_instruction_sltiu_mem_addr),
    .spec_mem_rmask(spec_instruction_sltiu_mem_rmask),
    .spec_mem_wmask(spec_instruction_sltiu_mem_wmask),
    .spec_mem_wdata(spec_instruction_sltiu_mem_wdata)
  );

  wire                                spec_instruction_sltu_valid;
  wire                                spec_instruction_sltu_trap;
  wire [                       4 : 0] spec_instruction_sltu_rs1_addr;
  wire [                       4 : 0] spec_instruction_sltu_rs2_addr;
  wire [                       4 : 0] spec_instruction_sltu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sltu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sltu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sltu_csr_misa_rmask;
`endif

  rvfi_instruction_sltu sltu (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_sltu_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_sltu_valid),
    .spec_trap(spec_instruction_sltu_trap),
    .spec_rs1_addr(spec_instruction_sltu_rs1_addr),
    .spec_rs2_addr(spec_instruction_sltu_rs2_addr),
    .spec_rd_addr(spec_instruction_sltu_rd_addr),
    .spec_rd_wdata(spec_instruction_sltu_rd_wdata),
    .spec_pc_wdata(spec_instruction_sltu_pc_wdata),
    .spec_mem_addr(spec_instruction_sltu_mem_addr),
    .spec_mem_rmask(spec_instruction_sltu_mem_rmask),
    .spec_mem_wmask(spec_instruction_sltu_mem_wmask),
    .spec_mem_wdata(spec_instruction_sltu_mem_wdata)
  );

  wire                                spec_instruction_sra_valid;
  wire                                spec_instruction_sra_trap;
  wire [                       4 : 0] spec_instruction_sra_rs1_addr;
  wire [                       4 : 0] spec_instruction_sra_rs2_addr;
  wire [                       4 : 0] spec_instruction_sra_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sra_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sra_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sra_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sra_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sra_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sra_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sra_csr_misa_rmask;
`endif

  rvfi_instruction_sra sra (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_sra_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_sra_valid),
    .spec_trap(spec_instruction_sra_trap),
    .spec_rs1_addr(spec_instruction_sra_rs1_addr),
    .spec_rs2_addr(spec_instruction_sra_rs2_addr),
    .spec_rd_addr(spec_instruction_sra_rd_addr),
    .spec_rd_wdata(spec_instruction_sra_rd_wdata),
    .spec_pc_wdata(spec_instruction_sra_pc_wdata),
    .spec_mem_addr(spec_instruction_sra_mem_addr),
    .spec_mem_rmask(spec_instruction_sra_mem_rmask),
    .spec_mem_wmask(spec_instruction_sra_mem_wmask),
    .spec_mem_wdata(spec_instruction_sra_mem_wdata)
  );

  wire                                spec_instruction_srai_valid;
  wire                                spec_instruction_srai_trap;
  wire [                       4 : 0] spec_instruction_srai_rs1_addr;
  wire [                       4 : 0] spec_instruction_srai_rs2_addr;
  wire [                       4 : 0] spec_instruction_srai_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srai_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srai_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srai_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_srai_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_srai_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srai_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srai_csr_misa_rmask;
`endif

  rvfi_instruction_srai srai (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_srai_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_srai_valid),
    .spec_trap(spec_instruction_srai_trap),
    .spec_rs1_addr(spec_instruction_srai_rs1_addr),
    .spec_rs2_addr(spec_instruction_srai_rs2_addr),
    .spec_rd_addr(spec_instruction_srai_rd_addr),
    .spec_rd_wdata(spec_instruction_srai_rd_wdata),
    .spec_pc_wdata(spec_instruction_srai_pc_wdata),
    .spec_mem_addr(spec_instruction_srai_mem_addr),
    .spec_mem_rmask(spec_instruction_srai_mem_rmask),
    .spec_mem_wmask(spec_instruction_srai_mem_wmask),
    .spec_mem_wdata(spec_instruction_srai_mem_wdata)
  );

  wire                                spec_instruction_srl_valid;
  wire                                spec_instruction_srl_trap;
  wire [                       4 : 0] spec_instruction_srl_rs1_addr;
  wire [                       4 : 0] spec_instruction_srl_rs2_addr;
  wire [                       4 : 0] spec_instruction_srl_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srl_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srl_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srl_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_srl_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_srl_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srl_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srl_csr_misa_rmask;
`endif

  rvfi_instruction_srl srl (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_srl_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_srl_valid),
    .spec_trap(spec_instruction_srl_trap),
    .spec_rs1_addr(spec_instruction_srl_rs1_addr),
    .spec_rs2_addr(spec_instruction_srl_rs2_addr),
    .spec_rd_addr(spec_instruction_srl_rd_addr),
    .spec_rd_wdata(spec_instruction_srl_rd_wdata),
    .spec_pc_wdata(spec_instruction_srl_pc_wdata),
    .spec_mem_addr(spec_instruction_srl_mem_addr),
    .spec_mem_rmask(spec_instruction_srl_mem_rmask),
    .spec_mem_wmask(spec_instruction_srl_mem_wmask),
    .spec_mem_wdata(spec_instruction_srl_mem_wdata)
  );

  wire                                spec_instruction_srli_valid;
  wire                                spec_instruction_srli_trap;
  wire [                       4 : 0] spec_instruction_srli_rs1_addr;
  wire [                       4 : 0] spec_instruction_srli_rs2_addr;
  wire [                       4 : 0] spec_instruction_srli_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srli_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srli_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srli_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_srli_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_srli_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srli_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_srli_csr_misa_rmask;
`endif

  rvfi_instruction_srli srli (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_srli_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_srli_valid),
    .spec_trap(spec_instruction_srli_trap),
    .spec_rs1_addr(spec_instruction_srli_rs1_addr),
    .spec_rs2_addr(spec_instruction_srli_rs2_addr),
    .spec_rd_addr(spec_instruction_srli_rd_addr),
    .spec_rd_wdata(spec_instruction_srli_rd_wdata),
    .spec_pc_wdata(spec_instruction_srli_pc_wdata),
    .spec_mem_addr(spec_instruction_srli_mem_addr),
    .spec_mem_rmask(spec_instruction_srli_mem_rmask),
    .spec_mem_wmask(spec_instruction_srli_mem_wmask),
    .spec_mem_wdata(spec_instruction_srli_mem_wdata)
  );

  wire                                spec_instruction_sub_valid;
  wire                                spec_instruction_sub_trap;
  wire [                       4 : 0] spec_instruction_sub_rs1_addr;
  wire [                       4 : 0] spec_instruction_sub_rs2_addr;
  wire [                       4 : 0] spec_instruction_sub_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sub_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sub_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sub_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sub_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sub_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sub_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sub_csr_misa_rmask;
`endif

  rvfi_instruction_sub sub (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_sub_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_sub_valid),
    .spec_trap(spec_instruction_sub_trap),
    .spec_rs1_addr(spec_instruction_sub_rs1_addr),
    .spec_rs2_addr(spec_instruction_sub_rs2_addr),
    .spec_rd_addr(spec_instruction_sub_rd_addr),
    .spec_rd_wdata(spec_instruction_sub_rd_wdata),
    .spec_pc_wdata(spec_instruction_sub_pc_wdata),
    .spec_mem_addr(spec_instruction_sub_mem_addr),
    .spec_mem_rmask(spec_instruction_sub_mem_rmask),
    .spec_mem_wmask(spec_instruction_sub_mem_wmask),
    .spec_mem_wdata(spec_instruction_sub_mem_wdata)
  );

  wire                                spec_instruction_sw_valid;
  wire                                spec_instruction_sw_trap;
  wire [                       4 : 0] spec_instruction_sw_rs1_addr;
  wire [                       4 : 0] spec_instruction_sw_rs2_addr;
  wire [                       4 : 0] spec_instruction_sw_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sw_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sw_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sw_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sw_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_sw_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sw_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_sw_csr_misa_rmask;
`endif

  rvfi_instruction_sw sw (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_sw_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_sw_valid),
    .spec_trap(spec_instruction_sw_trap),
    .spec_rs1_addr(spec_instruction_sw_rs1_addr),
    .spec_rs2_addr(spec_instruction_sw_rs2_addr),
    .spec_rd_addr(spec_instruction_sw_rd_addr),
    .spec_rd_wdata(spec_instruction_sw_rd_wdata),
    .spec_pc_wdata(spec_instruction_sw_pc_wdata),
    .spec_mem_addr(spec_instruction_sw_mem_addr),
    .spec_mem_rmask(spec_instruction_sw_mem_rmask),
    .spec_mem_wmask(spec_instruction_sw_mem_wmask),
    .spec_mem_wdata(spec_instruction_sw_mem_wdata)
  );

  wire                                spec_instruction_xor_valid;
  wire                                spec_instruction_xor_trap;
  wire [                       4 : 0] spec_instruction_xor_rs1_addr;
  wire [                       4 : 0] spec_instruction_xor_rs2_addr;
  wire [                       4 : 0] spec_instruction_xor_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xor_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xor_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xor_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_xor_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_xor_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xor_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xor_csr_misa_rmask;
`endif

  rvfi_instruction_xor xor (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_xor_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_xor_valid),
    .spec_trap(spec_instruction_xor_trap),
    .spec_rs1_addr(spec_instruction_xor_rs1_addr),
    .spec_rs2_addr(spec_instruction_xor_rs2_addr),
    .spec_rd_addr(spec_instruction_xor_rd_addr),
    .spec_rd_wdata(spec_instruction_xor_rd_wdata),
    .spec_pc_wdata(spec_instruction_xor_pc_wdata),
    .spec_mem_addr(spec_instruction_xor_mem_addr),
    .spec_mem_rmask(spec_instruction_xor_mem_rmask),
    .spec_mem_wmask(spec_instruction_xor_mem_wmask),
    .spec_mem_wdata(spec_instruction_xor_mem_wdata)
  );

  wire                                spec_instruction_xori_valid;
  wire                                spec_instruction_xori_trap;
  wire [                       4 : 0] spec_instruction_xori_rs1_addr;
  wire [                       4 : 0] spec_instruction_xori_rs2_addr;
  wire [                       4 : 0] spec_instruction_xori_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xori_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xori_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xori_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_xori_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_xori_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xori_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_xori_csr_misa_rmask;
`endif

  rvfi_instruction_xori xori (
    .rvfi_valid(rvfi_valid),
    .rvfi_instruction(rvfi_instruction),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_instruction_xori_csr_misa_rmask),
`endif
    .spec_valid(spec_instruction_xori_valid),
    .spec_trap(spec_instruction_xori_trap),
    .spec_rs1_addr(spec_instruction_xori_rs1_addr),
    .spec_rs2_addr(spec_instruction_xori_rs2_addr),
    .spec_rd_addr(spec_instruction_xori_rd_addr),
    .spec_rd_wdata(spec_instruction_xori_rd_wdata),
    .spec_pc_wdata(spec_instruction_xori_pc_wdata),
    .spec_mem_addr(spec_instruction_xori_mem_addr),
    .spec_mem_rmask(spec_instruction_xori_mem_rmask),
    .spec_mem_wmask(spec_instruction_xori_mem_wmask),
    .spec_mem_wdata(spec_instruction_xori_mem_wdata)
  );

  assign spec_valid =
		spec_instruction_add_valid ? spec_instruction_add_valid :
		spec_instruction_addi_valid ? spec_instruction_addi_valid :
		spec_instruction_and_valid ? spec_instruction_and_valid :
		spec_instruction_andi_valid ? spec_instruction_andi_valid :
		spec_instruction_auipc_valid ? spec_instruction_auipc_valid :
		spec_instruction_beq_valid ? spec_instruction_beq_valid :
		spec_instruction_bge_valid ? spec_instruction_bge_valid :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_valid :
		spec_instruction_blt_valid ? spec_instruction_blt_valid :
		spec_instruction_bltu_valid ? spec_instruction_bltu_valid :
		spec_instruction_bne_valid ? spec_instruction_bne_valid :
		spec_instruction_c_add_valid ? spec_instruction_c_add_valid :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_valid :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_valid :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_valid :
		spec_instruction_c_and_valid ? spec_instruction_c_and_valid :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_valid :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_valid :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_valid :
		spec_instruction_c_j_valid ? spec_instruction_c_j_valid :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_valid :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_valid :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_valid :
		spec_instruction_c_li_valid ? spec_instruction_c_li_valid :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_valid :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_valid :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_valid :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_valid :
		spec_instruction_c_or_valid ? spec_instruction_c_or_valid :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_valid :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_valid :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_valid :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_valid :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_valid :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_valid :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_valid :
		spec_instruction_jal_valid ? spec_instruction_jal_valid :
		spec_instruction_jalr_valid ? spec_instruction_jalr_valid :
		spec_instruction_lb_valid ? spec_instruction_lb_valid :
		spec_instruction_lbu_valid ? spec_instruction_lbu_valid :
		spec_instruction_lh_valid ? spec_instruction_lh_valid :
		spec_instruction_lhu_valid ? spec_instruction_lhu_valid :
		spec_instruction_lui_valid ? spec_instruction_lui_valid :
		spec_instruction_lw_valid ? spec_instruction_lw_valid :
		spec_instruction_or_valid ? spec_instruction_or_valid :
		spec_instruction_ori_valid ? spec_instruction_ori_valid :
		spec_instruction_sb_valid ? spec_instruction_sb_valid :
		spec_instruction_sh_valid ? spec_instruction_sh_valid :
		spec_instruction_sll_valid ? spec_instruction_sll_valid :
		spec_instruction_slli_valid ? spec_instruction_slli_valid :
		spec_instruction_slt_valid ? spec_instruction_slt_valid :
		spec_instruction_slti_valid ? spec_instruction_slti_valid :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_valid :
		spec_instruction_sltu_valid ? spec_instruction_sltu_valid :
		spec_instruction_sra_valid ? spec_instruction_sra_valid :
		spec_instruction_srai_valid ? spec_instruction_srai_valid :
		spec_instruction_srl_valid ? spec_instruction_srl_valid :
		spec_instruction_srli_valid ? spec_instruction_srli_valid :
		spec_instruction_sub_valid ? spec_instruction_sub_valid :
		spec_instruction_sw_valid ? spec_instruction_sw_valid :
		spec_instruction_xor_valid ? spec_instruction_xor_valid :
		spec_instruction_xori_valid ? spec_instruction_xori_valid : 0;
  assign spec_trap =
		spec_instruction_add_valid ? spec_instruction_add_trap :
		spec_instruction_addi_valid ? spec_instruction_addi_trap :
		spec_instruction_and_valid ? spec_instruction_and_trap :
		spec_instruction_andi_valid ? spec_instruction_andi_trap :
		spec_instruction_auipc_valid ? spec_instruction_auipc_trap :
		spec_instruction_beq_valid ? spec_instruction_beq_trap :
		spec_instruction_bge_valid ? spec_instruction_bge_trap :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_trap :
		spec_instruction_blt_valid ? spec_instruction_blt_trap :
		spec_instruction_bltu_valid ? spec_instruction_bltu_trap :
		spec_instruction_bne_valid ? spec_instruction_bne_trap :
		spec_instruction_c_add_valid ? spec_instruction_c_add_trap :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_trap :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_trap :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_trap :
		spec_instruction_c_and_valid ? spec_instruction_c_and_trap :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_trap :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_trap :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_trap :
		spec_instruction_c_j_valid ? spec_instruction_c_j_trap :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_trap :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_trap :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_trap :
		spec_instruction_c_li_valid ? spec_instruction_c_li_trap :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_trap :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_trap :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_trap :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_trap :
		spec_instruction_c_or_valid ? spec_instruction_c_or_trap :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_trap :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_trap :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_trap :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_trap :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_trap :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_trap :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_trap :
		spec_instruction_jal_valid ? spec_instruction_jal_trap :
		spec_instruction_jalr_valid ? spec_instruction_jalr_trap :
		spec_instruction_lb_valid ? spec_instruction_lb_trap :
		spec_instruction_lbu_valid ? spec_instruction_lbu_trap :
		spec_instruction_lh_valid ? spec_instruction_lh_trap :
		spec_instruction_lhu_valid ? spec_instruction_lhu_trap :
		spec_instruction_lui_valid ? spec_instruction_lui_trap :
		spec_instruction_lw_valid ? spec_instruction_lw_trap :
		spec_instruction_or_valid ? spec_instruction_or_trap :
		spec_instruction_ori_valid ? spec_instruction_ori_trap :
		spec_instruction_sb_valid ? spec_instruction_sb_trap :
		spec_instruction_sh_valid ? spec_instruction_sh_trap :
		spec_instruction_sll_valid ? spec_instruction_sll_trap :
		spec_instruction_slli_valid ? spec_instruction_slli_trap :
		spec_instruction_slt_valid ? spec_instruction_slt_trap :
		spec_instruction_slti_valid ? spec_instruction_slti_trap :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_trap :
		spec_instruction_sltu_valid ? spec_instruction_sltu_trap :
		spec_instruction_sra_valid ? spec_instruction_sra_trap :
		spec_instruction_srai_valid ? spec_instruction_srai_trap :
		spec_instruction_srl_valid ? spec_instruction_srl_trap :
		spec_instruction_srli_valid ? spec_instruction_srli_trap :
		spec_instruction_sub_valid ? spec_instruction_sub_trap :
		spec_instruction_sw_valid ? spec_instruction_sw_trap :
		spec_instruction_xor_valid ? spec_instruction_xor_trap :
		spec_instruction_xori_valid ? spec_instruction_xori_trap : 0;
  assign spec_rs1_addr =
		spec_instruction_add_valid ? spec_instruction_add_rs1_addr :
		spec_instruction_addi_valid ? spec_instruction_addi_rs1_addr :
		spec_instruction_and_valid ? spec_instruction_and_rs1_addr :
		spec_instruction_andi_valid ? spec_instruction_andi_rs1_addr :
		spec_instruction_auipc_valid ? spec_instruction_auipc_rs1_addr :
		spec_instruction_beq_valid ? spec_instruction_beq_rs1_addr :
		spec_instruction_bge_valid ? spec_instruction_bge_rs1_addr :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_rs1_addr :
		spec_instruction_blt_valid ? spec_instruction_blt_rs1_addr :
		spec_instruction_bltu_valid ? spec_instruction_bltu_rs1_addr :
		spec_instruction_bne_valid ? spec_instruction_bne_rs1_addr :
		spec_instruction_c_add_valid ? spec_instruction_c_add_rs1_addr :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_rs1_addr :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_rs1_addr :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_rs1_addr :
		spec_instruction_c_and_valid ? spec_instruction_c_and_rs1_addr :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_rs1_addr :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_rs1_addr :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_rs1_addr :
		spec_instruction_c_j_valid ? spec_instruction_c_j_rs1_addr :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_rs1_addr :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_rs1_addr :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_rs1_addr :
		spec_instruction_c_li_valid ? spec_instruction_c_li_rs1_addr :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_rs1_addr :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_rs1_addr :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_rs1_addr :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_rs1_addr :
		spec_instruction_c_or_valid ? spec_instruction_c_or_rs1_addr :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_rs1_addr :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_rs1_addr :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_rs1_addr :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_rs1_addr :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_rs1_addr :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_rs1_addr :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_rs1_addr :
		spec_instruction_jal_valid ? spec_instruction_jal_rs1_addr :
		spec_instruction_jalr_valid ? spec_instruction_jalr_rs1_addr :
		spec_instruction_lb_valid ? spec_instruction_lb_rs1_addr :
		spec_instruction_lbu_valid ? spec_instruction_lbu_rs1_addr :
		spec_instruction_lh_valid ? spec_instruction_lh_rs1_addr :
		spec_instruction_lhu_valid ? spec_instruction_lhu_rs1_addr :
		spec_instruction_lui_valid ? spec_instruction_lui_rs1_addr :
		spec_instruction_lw_valid ? spec_instruction_lw_rs1_addr :
		spec_instruction_or_valid ? spec_instruction_or_rs1_addr :
		spec_instruction_ori_valid ? spec_instruction_ori_rs1_addr :
		spec_instruction_sb_valid ? spec_instruction_sb_rs1_addr :
		spec_instruction_sh_valid ? spec_instruction_sh_rs1_addr :
		spec_instruction_sll_valid ? spec_instruction_sll_rs1_addr :
		spec_instruction_slli_valid ? spec_instruction_slli_rs1_addr :
		spec_instruction_slt_valid ? spec_instruction_slt_rs1_addr :
		spec_instruction_slti_valid ? spec_instruction_slti_rs1_addr :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_rs1_addr :
		spec_instruction_sltu_valid ? spec_instruction_sltu_rs1_addr :
		spec_instruction_sra_valid ? spec_instruction_sra_rs1_addr :
		spec_instruction_srai_valid ? spec_instruction_srai_rs1_addr :
		spec_instruction_srl_valid ? spec_instruction_srl_rs1_addr :
		spec_instruction_srli_valid ? spec_instruction_srli_rs1_addr :
		spec_instruction_sub_valid ? spec_instruction_sub_rs1_addr :
		spec_instruction_sw_valid ? spec_instruction_sw_rs1_addr :
		spec_instruction_xor_valid ? spec_instruction_xor_rs1_addr :
		spec_instruction_xori_valid ? spec_instruction_xori_rs1_addr : 0;
  assign spec_rs2_addr =
		spec_instruction_add_valid ? spec_instruction_add_rs2_addr :
		spec_instruction_addi_valid ? spec_instruction_addi_rs2_addr :
		spec_instruction_and_valid ? spec_instruction_and_rs2_addr :
		spec_instruction_andi_valid ? spec_instruction_andi_rs2_addr :
		spec_instruction_auipc_valid ? spec_instruction_auipc_rs2_addr :
		spec_instruction_beq_valid ? spec_instruction_beq_rs2_addr :
		spec_instruction_bge_valid ? spec_instruction_bge_rs2_addr :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_rs2_addr :
		spec_instruction_blt_valid ? spec_instruction_blt_rs2_addr :
		spec_instruction_bltu_valid ? spec_instruction_bltu_rs2_addr :
		spec_instruction_bne_valid ? spec_instruction_bne_rs2_addr :
		spec_instruction_c_add_valid ? spec_instruction_c_add_rs2_addr :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_rs2_addr :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_rs2_addr :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_rs2_addr :
		spec_instruction_c_and_valid ? spec_instruction_c_and_rs2_addr :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_rs2_addr :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_rs2_addr :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_rs2_addr :
		spec_instruction_c_j_valid ? spec_instruction_c_j_rs2_addr :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_rs2_addr :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_rs2_addr :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_rs2_addr :
		spec_instruction_c_li_valid ? spec_instruction_c_li_rs2_addr :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_rs2_addr :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_rs2_addr :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_rs2_addr :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_rs2_addr :
		spec_instruction_c_or_valid ? spec_instruction_c_or_rs2_addr :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_rs2_addr :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_rs2_addr :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_rs2_addr :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_rs2_addr :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_rs2_addr :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_rs2_addr :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_rs2_addr :
		spec_instruction_jal_valid ? spec_instruction_jal_rs2_addr :
		spec_instruction_jalr_valid ? spec_instruction_jalr_rs2_addr :
		spec_instruction_lb_valid ? spec_instruction_lb_rs2_addr :
		spec_instruction_lbu_valid ? spec_instruction_lbu_rs2_addr :
		spec_instruction_lh_valid ? spec_instruction_lh_rs2_addr :
		spec_instruction_lhu_valid ? spec_instruction_lhu_rs2_addr :
		spec_instruction_lui_valid ? spec_instruction_lui_rs2_addr :
		spec_instruction_lw_valid ? spec_instruction_lw_rs2_addr :
		spec_instruction_or_valid ? spec_instruction_or_rs2_addr :
		spec_instruction_ori_valid ? spec_instruction_ori_rs2_addr :
		spec_instruction_sb_valid ? spec_instruction_sb_rs2_addr :
		spec_instruction_sh_valid ? spec_instruction_sh_rs2_addr :
		spec_instruction_sll_valid ? spec_instruction_sll_rs2_addr :
		spec_instruction_slli_valid ? spec_instruction_slli_rs2_addr :
		spec_instruction_slt_valid ? spec_instruction_slt_rs2_addr :
		spec_instruction_slti_valid ? spec_instruction_slti_rs2_addr :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_rs2_addr :
		spec_instruction_sltu_valid ? spec_instruction_sltu_rs2_addr :
		spec_instruction_sra_valid ? spec_instruction_sra_rs2_addr :
		spec_instruction_srai_valid ? spec_instruction_srai_rs2_addr :
		spec_instruction_srl_valid ? spec_instruction_srl_rs2_addr :
		spec_instruction_srli_valid ? spec_instruction_srli_rs2_addr :
		spec_instruction_sub_valid ? spec_instruction_sub_rs2_addr :
		spec_instruction_sw_valid ? spec_instruction_sw_rs2_addr :
		spec_instruction_xor_valid ? spec_instruction_xor_rs2_addr :
		spec_instruction_xori_valid ? spec_instruction_xori_rs2_addr : 0;
  assign spec_rd_addr =
		spec_instruction_add_valid ? spec_instruction_add_rd_addr :
		spec_instruction_addi_valid ? spec_instruction_addi_rd_addr :
		spec_instruction_and_valid ? spec_instruction_and_rd_addr :
		spec_instruction_andi_valid ? spec_instruction_andi_rd_addr :
		spec_instruction_auipc_valid ? spec_instruction_auipc_rd_addr :
		spec_instruction_beq_valid ? spec_instruction_beq_rd_addr :
		spec_instruction_bge_valid ? spec_instruction_bge_rd_addr :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_rd_addr :
		spec_instruction_blt_valid ? spec_instruction_blt_rd_addr :
		spec_instruction_bltu_valid ? spec_instruction_bltu_rd_addr :
		spec_instruction_bne_valid ? spec_instruction_bne_rd_addr :
		spec_instruction_c_add_valid ? spec_instruction_c_add_rd_addr :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_rd_addr :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_rd_addr :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_rd_addr :
		spec_instruction_c_and_valid ? spec_instruction_c_and_rd_addr :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_rd_addr :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_rd_addr :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_rd_addr :
		spec_instruction_c_j_valid ? spec_instruction_c_j_rd_addr :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_rd_addr :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_rd_addr :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_rd_addr :
		spec_instruction_c_li_valid ? spec_instruction_c_li_rd_addr :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_rd_addr :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_rd_addr :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_rd_addr :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_rd_addr :
		spec_instruction_c_or_valid ? spec_instruction_c_or_rd_addr :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_rd_addr :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_rd_addr :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_rd_addr :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_rd_addr :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_rd_addr :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_rd_addr :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_rd_addr :
		spec_instruction_jal_valid ? spec_instruction_jal_rd_addr :
		spec_instruction_jalr_valid ? spec_instruction_jalr_rd_addr :
		spec_instruction_lb_valid ? spec_instruction_lb_rd_addr :
		spec_instruction_lbu_valid ? spec_instruction_lbu_rd_addr :
		spec_instruction_lh_valid ? spec_instruction_lh_rd_addr :
		spec_instruction_lhu_valid ? spec_instruction_lhu_rd_addr :
		spec_instruction_lui_valid ? spec_instruction_lui_rd_addr :
		spec_instruction_lw_valid ? spec_instruction_lw_rd_addr :
		spec_instruction_or_valid ? spec_instruction_or_rd_addr :
		spec_instruction_ori_valid ? spec_instruction_ori_rd_addr :
		spec_instruction_sb_valid ? spec_instruction_sb_rd_addr :
		spec_instruction_sh_valid ? spec_instruction_sh_rd_addr :
		spec_instruction_sll_valid ? spec_instruction_sll_rd_addr :
		spec_instruction_slli_valid ? spec_instruction_slli_rd_addr :
		spec_instruction_slt_valid ? spec_instruction_slt_rd_addr :
		spec_instruction_slti_valid ? spec_instruction_slti_rd_addr :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_rd_addr :
		spec_instruction_sltu_valid ? spec_instruction_sltu_rd_addr :
		spec_instruction_sra_valid ? spec_instruction_sra_rd_addr :
		spec_instruction_srai_valid ? spec_instruction_srai_rd_addr :
		spec_instruction_srl_valid ? spec_instruction_srl_rd_addr :
		spec_instruction_srli_valid ? spec_instruction_srli_rd_addr :
		spec_instruction_sub_valid ? spec_instruction_sub_rd_addr :
		spec_instruction_sw_valid ? spec_instruction_sw_rd_addr :
		spec_instruction_xor_valid ? spec_instruction_xor_rd_addr :
		spec_instruction_xori_valid ? spec_instruction_xori_rd_addr : 0;
  assign spec_rd_wdata =
		spec_instruction_add_valid ? spec_instruction_add_rd_wdata :
		spec_instruction_addi_valid ? spec_instruction_addi_rd_wdata :
		spec_instruction_and_valid ? spec_instruction_and_rd_wdata :
		spec_instruction_andi_valid ? spec_instruction_andi_rd_wdata :
		spec_instruction_auipc_valid ? spec_instruction_auipc_rd_wdata :
		spec_instruction_beq_valid ? spec_instruction_beq_rd_wdata :
		spec_instruction_bge_valid ? spec_instruction_bge_rd_wdata :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_rd_wdata :
		spec_instruction_blt_valid ? spec_instruction_blt_rd_wdata :
		spec_instruction_bltu_valid ? spec_instruction_bltu_rd_wdata :
		spec_instruction_bne_valid ? spec_instruction_bne_rd_wdata :
		spec_instruction_c_add_valid ? spec_instruction_c_add_rd_wdata :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_rd_wdata :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_rd_wdata :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_rd_wdata :
		spec_instruction_c_and_valid ? spec_instruction_c_and_rd_wdata :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_rd_wdata :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_rd_wdata :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_rd_wdata :
		spec_instruction_c_j_valid ? spec_instruction_c_j_rd_wdata :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_rd_wdata :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_rd_wdata :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_rd_wdata :
		spec_instruction_c_li_valid ? spec_instruction_c_li_rd_wdata :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_rd_wdata :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_rd_wdata :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_rd_wdata :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_rd_wdata :
		spec_instruction_c_or_valid ? spec_instruction_c_or_rd_wdata :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_rd_wdata :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_rd_wdata :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_rd_wdata :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_rd_wdata :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_rd_wdata :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_rd_wdata :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_rd_wdata :
		spec_instruction_jal_valid ? spec_instruction_jal_rd_wdata :
		spec_instruction_jalr_valid ? spec_instruction_jalr_rd_wdata :
		spec_instruction_lb_valid ? spec_instruction_lb_rd_wdata :
		spec_instruction_lbu_valid ? spec_instruction_lbu_rd_wdata :
		spec_instruction_lh_valid ? spec_instruction_lh_rd_wdata :
		spec_instruction_lhu_valid ? spec_instruction_lhu_rd_wdata :
		spec_instruction_lui_valid ? spec_instruction_lui_rd_wdata :
		spec_instruction_lw_valid ? spec_instruction_lw_rd_wdata :
		spec_instruction_or_valid ? spec_instruction_or_rd_wdata :
		spec_instruction_ori_valid ? spec_instruction_ori_rd_wdata :
		spec_instruction_sb_valid ? spec_instruction_sb_rd_wdata :
		spec_instruction_sh_valid ? spec_instruction_sh_rd_wdata :
		spec_instruction_sll_valid ? spec_instruction_sll_rd_wdata :
		spec_instruction_slli_valid ? spec_instruction_slli_rd_wdata :
		spec_instruction_slt_valid ? spec_instruction_slt_rd_wdata :
		spec_instruction_slti_valid ? spec_instruction_slti_rd_wdata :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_rd_wdata :
		spec_instruction_sltu_valid ? spec_instruction_sltu_rd_wdata :
		spec_instruction_sra_valid ? spec_instruction_sra_rd_wdata :
		spec_instruction_srai_valid ? spec_instruction_srai_rd_wdata :
		spec_instruction_srl_valid ? spec_instruction_srl_rd_wdata :
		spec_instruction_srli_valid ? spec_instruction_srli_rd_wdata :
		spec_instruction_sub_valid ? spec_instruction_sub_rd_wdata :
		spec_instruction_sw_valid ? spec_instruction_sw_rd_wdata :
		spec_instruction_xor_valid ? spec_instruction_xor_rd_wdata :
		spec_instruction_xori_valid ? spec_instruction_xori_rd_wdata : 0;
  assign spec_pc_wdata =
		spec_instruction_add_valid ? spec_instruction_add_pc_wdata :
		spec_instruction_addi_valid ? spec_instruction_addi_pc_wdata :
		spec_instruction_and_valid ? spec_instruction_and_pc_wdata :
		spec_instruction_andi_valid ? spec_instruction_andi_pc_wdata :
		spec_instruction_auipc_valid ? spec_instruction_auipc_pc_wdata :
		spec_instruction_beq_valid ? spec_instruction_beq_pc_wdata :
		spec_instruction_bge_valid ? spec_instruction_bge_pc_wdata :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_pc_wdata :
		spec_instruction_blt_valid ? spec_instruction_blt_pc_wdata :
		spec_instruction_bltu_valid ? spec_instruction_bltu_pc_wdata :
		spec_instruction_bne_valid ? spec_instruction_bne_pc_wdata :
		spec_instruction_c_add_valid ? spec_instruction_c_add_pc_wdata :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_pc_wdata :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_pc_wdata :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_pc_wdata :
		spec_instruction_c_and_valid ? spec_instruction_c_and_pc_wdata :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_pc_wdata :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_pc_wdata :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_pc_wdata :
		spec_instruction_c_j_valid ? spec_instruction_c_j_pc_wdata :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_pc_wdata :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_pc_wdata :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_pc_wdata :
		spec_instruction_c_li_valid ? spec_instruction_c_li_pc_wdata :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_pc_wdata :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_pc_wdata :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_pc_wdata :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_pc_wdata :
		spec_instruction_c_or_valid ? spec_instruction_c_or_pc_wdata :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_pc_wdata :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_pc_wdata :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_pc_wdata :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_pc_wdata :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_pc_wdata :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_pc_wdata :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_pc_wdata :
		spec_instruction_jal_valid ? spec_instruction_jal_pc_wdata :
		spec_instruction_jalr_valid ? spec_instruction_jalr_pc_wdata :
		spec_instruction_lb_valid ? spec_instruction_lb_pc_wdata :
		spec_instruction_lbu_valid ? spec_instruction_lbu_pc_wdata :
		spec_instruction_lh_valid ? spec_instruction_lh_pc_wdata :
		spec_instruction_lhu_valid ? spec_instruction_lhu_pc_wdata :
		spec_instruction_lui_valid ? spec_instruction_lui_pc_wdata :
		spec_instruction_lw_valid ? spec_instruction_lw_pc_wdata :
		spec_instruction_or_valid ? spec_instruction_or_pc_wdata :
		spec_instruction_ori_valid ? spec_instruction_ori_pc_wdata :
		spec_instruction_sb_valid ? spec_instruction_sb_pc_wdata :
		spec_instruction_sh_valid ? spec_instruction_sh_pc_wdata :
		spec_instruction_sll_valid ? spec_instruction_sll_pc_wdata :
		spec_instruction_slli_valid ? spec_instruction_slli_pc_wdata :
		spec_instruction_slt_valid ? spec_instruction_slt_pc_wdata :
		spec_instruction_slti_valid ? spec_instruction_slti_pc_wdata :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_pc_wdata :
		spec_instruction_sltu_valid ? spec_instruction_sltu_pc_wdata :
		spec_instruction_sra_valid ? spec_instruction_sra_pc_wdata :
		spec_instruction_srai_valid ? spec_instruction_srai_pc_wdata :
		spec_instruction_srl_valid ? spec_instruction_srl_pc_wdata :
		spec_instruction_srli_valid ? spec_instruction_srli_pc_wdata :
		spec_instruction_sub_valid ? spec_instruction_sub_pc_wdata :
		spec_instruction_sw_valid ? spec_instruction_sw_pc_wdata :
		spec_instruction_xor_valid ? spec_instruction_xor_pc_wdata :
		spec_instruction_xori_valid ? spec_instruction_xori_pc_wdata : 0;
  assign spec_mem_addr =
		spec_instruction_add_valid ? spec_instruction_add_mem_addr :
		spec_instruction_addi_valid ? spec_instruction_addi_mem_addr :
		spec_instruction_and_valid ? spec_instruction_and_mem_addr :
		spec_instruction_andi_valid ? spec_instruction_andi_mem_addr :
		spec_instruction_auipc_valid ? spec_instruction_auipc_mem_addr :
		spec_instruction_beq_valid ? spec_instruction_beq_mem_addr :
		spec_instruction_bge_valid ? spec_instruction_bge_mem_addr :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_mem_addr :
		spec_instruction_blt_valid ? spec_instruction_blt_mem_addr :
		spec_instruction_bltu_valid ? spec_instruction_bltu_mem_addr :
		spec_instruction_bne_valid ? spec_instruction_bne_mem_addr :
		spec_instruction_c_add_valid ? spec_instruction_c_add_mem_addr :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_mem_addr :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_mem_addr :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_mem_addr :
		spec_instruction_c_and_valid ? spec_instruction_c_and_mem_addr :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_mem_addr :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_mem_addr :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_mem_addr :
		spec_instruction_c_j_valid ? spec_instruction_c_j_mem_addr :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_mem_addr :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_mem_addr :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_mem_addr :
		spec_instruction_c_li_valid ? spec_instruction_c_li_mem_addr :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_mem_addr :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_mem_addr :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_mem_addr :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_mem_addr :
		spec_instruction_c_or_valid ? spec_instruction_c_or_mem_addr :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_mem_addr :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_mem_addr :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_mem_addr :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_mem_addr :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_mem_addr :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_mem_addr :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_mem_addr :
		spec_instruction_jal_valid ? spec_instruction_jal_mem_addr :
		spec_instruction_jalr_valid ? spec_instruction_jalr_mem_addr :
		spec_instruction_lb_valid ? spec_instruction_lb_mem_addr :
		spec_instruction_lbu_valid ? spec_instruction_lbu_mem_addr :
		spec_instruction_lh_valid ? spec_instruction_lh_mem_addr :
		spec_instruction_lhu_valid ? spec_instruction_lhu_mem_addr :
		spec_instruction_lui_valid ? spec_instruction_lui_mem_addr :
		spec_instruction_lw_valid ? spec_instruction_lw_mem_addr :
		spec_instruction_or_valid ? spec_instruction_or_mem_addr :
		spec_instruction_ori_valid ? spec_instruction_ori_mem_addr :
		spec_instruction_sb_valid ? spec_instruction_sb_mem_addr :
		spec_instruction_sh_valid ? spec_instruction_sh_mem_addr :
		spec_instruction_sll_valid ? spec_instruction_sll_mem_addr :
		spec_instruction_slli_valid ? spec_instruction_slli_mem_addr :
		spec_instruction_slt_valid ? spec_instruction_slt_mem_addr :
		spec_instruction_slti_valid ? spec_instruction_slti_mem_addr :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_mem_addr :
		spec_instruction_sltu_valid ? spec_instruction_sltu_mem_addr :
		spec_instruction_sra_valid ? spec_instruction_sra_mem_addr :
		spec_instruction_srai_valid ? spec_instruction_srai_mem_addr :
		spec_instruction_srl_valid ? spec_instruction_srl_mem_addr :
		spec_instruction_srli_valid ? spec_instruction_srli_mem_addr :
		spec_instruction_sub_valid ? spec_instruction_sub_mem_addr :
		spec_instruction_sw_valid ? spec_instruction_sw_mem_addr :
		spec_instruction_xor_valid ? spec_instruction_xor_mem_addr :
		spec_instruction_xori_valid ? spec_instruction_xori_mem_addr : 0;
  assign spec_mem_rmask =
		spec_instruction_add_valid ? spec_instruction_add_mem_rmask :
		spec_instruction_addi_valid ? spec_instruction_addi_mem_rmask :
		spec_instruction_and_valid ? spec_instruction_and_mem_rmask :
		spec_instruction_andi_valid ? spec_instruction_andi_mem_rmask :
		spec_instruction_auipc_valid ? spec_instruction_auipc_mem_rmask :
		spec_instruction_beq_valid ? spec_instruction_beq_mem_rmask :
		spec_instruction_bge_valid ? spec_instruction_bge_mem_rmask :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_mem_rmask :
		spec_instruction_blt_valid ? spec_instruction_blt_mem_rmask :
		spec_instruction_bltu_valid ? spec_instruction_bltu_mem_rmask :
		spec_instruction_bne_valid ? spec_instruction_bne_mem_rmask :
		spec_instruction_c_add_valid ? spec_instruction_c_add_mem_rmask :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_mem_rmask :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_mem_rmask :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_mem_rmask :
		spec_instruction_c_and_valid ? spec_instruction_c_and_mem_rmask :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_mem_rmask :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_mem_rmask :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_mem_rmask :
		spec_instruction_c_j_valid ? spec_instruction_c_j_mem_rmask :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_mem_rmask :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_mem_rmask :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_mem_rmask :
		spec_instruction_c_li_valid ? spec_instruction_c_li_mem_rmask :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_mem_rmask :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_mem_rmask :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_mem_rmask :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_mem_rmask :
		spec_instruction_c_or_valid ? spec_instruction_c_or_mem_rmask :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_mem_rmask :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_mem_rmask :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_mem_rmask :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_mem_rmask :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_mem_rmask :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_mem_rmask :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_mem_rmask :
		spec_instruction_jal_valid ? spec_instruction_jal_mem_rmask :
		spec_instruction_jalr_valid ? spec_instruction_jalr_mem_rmask :
		spec_instruction_lb_valid ? spec_instruction_lb_mem_rmask :
		spec_instruction_lbu_valid ? spec_instruction_lbu_mem_rmask :
		spec_instruction_lh_valid ? spec_instruction_lh_mem_rmask :
		spec_instruction_lhu_valid ? spec_instruction_lhu_mem_rmask :
		spec_instruction_lui_valid ? spec_instruction_lui_mem_rmask :
		spec_instruction_lw_valid ? spec_instruction_lw_mem_rmask :
		spec_instruction_or_valid ? spec_instruction_or_mem_rmask :
		spec_instruction_ori_valid ? spec_instruction_ori_mem_rmask :
		spec_instruction_sb_valid ? spec_instruction_sb_mem_rmask :
		spec_instruction_sh_valid ? spec_instruction_sh_mem_rmask :
		spec_instruction_sll_valid ? spec_instruction_sll_mem_rmask :
		spec_instruction_slli_valid ? spec_instruction_slli_mem_rmask :
		spec_instruction_slt_valid ? spec_instruction_slt_mem_rmask :
		spec_instruction_slti_valid ? spec_instruction_slti_mem_rmask :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_mem_rmask :
		spec_instruction_sltu_valid ? spec_instruction_sltu_mem_rmask :
		spec_instruction_sra_valid ? spec_instruction_sra_mem_rmask :
		spec_instruction_srai_valid ? spec_instruction_srai_mem_rmask :
		spec_instruction_srl_valid ? spec_instruction_srl_mem_rmask :
		spec_instruction_srli_valid ? spec_instruction_srli_mem_rmask :
		spec_instruction_sub_valid ? spec_instruction_sub_mem_rmask :
		spec_instruction_sw_valid ? spec_instruction_sw_mem_rmask :
		spec_instruction_xor_valid ? spec_instruction_xor_mem_rmask :
		spec_instruction_xori_valid ? spec_instruction_xori_mem_rmask : 0;
  assign spec_mem_wmask =
		spec_instruction_add_valid ? spec_instruction_add_mem_wmask :
		spec_instruction_addi_valid ? spec_instruction_addi_mem_wmask :
		spec_instruction_and_valid ? spec_instruction_and_mem_wmask :
		spec_instruction_andi_valid ? spec_instruction_andi_mem_wmask :
		spec_instruction_auipc_valid ? spec_instruction_auipc_mem_wmask :
		spec_instruction_beq_valid ? spec_instruction_beq_mem_wmask :
		spec_instruction_bge_valid ? spec_instruction_bge_mem_wmask :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_mem_wmask :
		spec_instruction_blt_valid ? spec_instruction_blt_mem_wmask :
		spec_instruction_bltu_valid ? spec_instruction_bltu_mem_wmask :
		spec_instruction_bne_valid ? spec_instruction_bne_mem_wmask :
		spec_instruction_c_add_valid ? spec_instruction_c_add_mem_wmask :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_mem_wmask :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_mem_wmask :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_mem_wmask :
		spec_instruction_c_and_valid ? spec_instruction_c_and_mem_wmask :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_mem_wmask :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_mem_wmask :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_mem_wmask :
		spec_instruction_c_j_valid ? spec_instruction_c_j_mem_wmask :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_mem_wmask :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_mem_wmask :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_mem_wmask :
		spec_instruction_c_li_valid ? spec_instruction_c_li_mem_wmask :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_mem_wmask :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_mem_wmask :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_mem_wmask :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_mem_wmask :
		spec_instruction_c_or_valid ? spec_instruction_c_or_mem_wmask :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_mem_wmask :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_mem_wmask :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_mem_wmask :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_mem_wmask :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_mem_wmask :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_mem_wmask :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_mem_wmask :
		spec_instruction_jal_valid ? spec_instruction_jal_mem_wmask :
		spec_instruction_jalr_valid ? spec_instruction_jalr_mem_wmask :
		spec_instruction_lb_valid ? spec_instruction_lb_mem_wmask :
		spec_instruction_lbu_valid ? spec_instruction_lbu_mem_wmask :
		spec_instruction_lh_valid ? spec_instruction_lh_mem_wmask :
		spec_instruction_lhu_valid ? spec_instruction_lhu_mem_wmask :
		spec_instruction_lui_valid ? spec_instruction_lui_mem_wmask :
		spec_instruction_lw_valid ? spec_instruction_lw_mem_wmask :
		spec_instruction_or_valid ? spec_instruction_or_mem_wmask :
		spec_instruction_ori_valid ? spec_instruction_ori_mem_wmask :
		spec_instruction_sb_valid ? spec_instruction_sb_mem_wmask :
		spec_instruction_sh_valid ? spec_instruction_sh_mem_wmask :
		spec_instruction_sll_valid ? spec_instruction_sll_mem_wmask :
		spec_instruction_slli_valid ? spec_instruction_slli_mem_wmask :
		spec_instruction_slt_valid ? spec_instruction_slt_mem_wmask :
		spec_instruction_slti_valid ? spec_instruction_slti_mem_wmask :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_mem_wmask :
		spec_instruction_sltu_valid ? spec_instruction_sltu_mem_wmask :
		spec_instruction_sra_valid ? spec_instruction_sra_mem_wmask :
		spec_instruction_srai_valid ? spec_instruction_srai_mem_wmask :
		spec_instruction_srl_valid ? spec_instruction_srl_mem_wmask :
		spec_instruction_srli_valid ? spec_instruction_srli_mem_wmask :
		spec_instruction_sub_valid ? spec_instruction_sub_mem_wmask :
		spec_instruction_sw_valid ? spec_instruction_sw_mem_wmask :
		spec_instruction_xor_valid ? spec_instruction_xor_mem_wmask :
		spec_instruction_xori_valid ? spec_instruction_xori_mem_wmask : 0;
  assign spec_mem_wdata =
		spec_instruction_add_valid ? spec_instruction_add_mem_wdata :
		spec_instruction_addi_valid ? spec_instruction_addi_mem_wdata :
		spec_instruction_and_valid ? spec_instruction_and_mem_wdata :
		spec_instruction_andi_valid ? spec_instruction_andi_mem_wdata :
		spec_instruction_auipc_valid ? spec_instruction_auipc_mem_wdata :
		spec_instruction_beq_valid ? spec_instruction_beq_mem_wdata :
		spec_instruction_bge_valid ? spec_instruction_bge_mem_wdata :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_mem_wdata :
		spec_instruction_blt_valid ? spec_instruction_blt_mem_wdata :
		spec_instruction_bltu_valid ? spec_instruction_bltu_mem_wdata :
		spec_instruction_bne_valid ? spec_instruction_bne_mem_wdata :
		spec_instruction_c_add_valid ? spec_instruction_c_add_mem_wdata :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_mem_wdata :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_mem_wdata :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_mem_wdata :
		spec_instruction_c_and_valid ? spec_instruction_c_and_mem_wdata :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_mem_wdata :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_mem_wdata :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_mem_wdata :
		spec_instruction_c_j_valid ? spec_instruction_c_j_mem_wdata :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_mem_wdata :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_mem_wdata :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_mem_wdata :
		spec_instruction_c_li_valid ? spec_instruction_c_li_mem_wdata :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_mem_wdata :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_mem_wdata :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_mem_wdata :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_mem_wdata :
		spec_instruction_c_or_valid ? spec_instruction_c_or_mem_wdata :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_mem_wdata :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_mem_wdata :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_mem_wdata :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_mem_wdata :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_mem_wdata :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_mem_wdata :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_mem_wdata :
		spec_instruction_jal_valid ? spec_instruction_jal_mem_wdata :
		spec_instruction_jalr_valid ? spec_instruction_jalr_mem_wdata :
		spec_instruction_lb_valid ? spec_instruction_lb_mem_wdata :
		spec_instruction_lbu_valid ? spec_instruction_lbu_mem_wdata :
		spec_instruction_lh_valid ? spec_instruction_lh_mem_wdata :
		spec_instruction_lhu_valid ? spec_instruction_lhu_mem_wdata :
		spec_instruction_lui_valid ? spec_instruction_lui_mem_wdata :
		spec_instruction_lw_valid ? spec_instruction_lw_mem_wdata :
		spec_instruction_or_valid ? spec_instruction_or_mem_wdata :
		spec_instruction_ori_valid ? spec_instruction_ori_mem_wdata :
		spec_instruction_sb_valid ? spec_instruction_sb_mem_wdata :
		spec_instruction_sh_valid ? spec_instruction_sh_mem_wdata :
		spec_instruction_sll_valid ? spec_instruction_sll_mem_wdata :
		spec_instruction_slli_valid ? spec_instruction_slli_mem_wdata :
		spec_instruction_slt_valid ? spec_instruction_slt_mem_wdata :
		spec_instruction_slti_valid ? spec_instruction_slti_mem_wdata :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_mem_wdata :
		spec_instruction_sltu_valid ? spec_instruction_sltu_mem_wdata :
		spec_instruction_sra_valid ? spec_instruction_sra_mem_wdata :
		spec_instruction_srai_valid ? spec_instruction_srai_mem_wdata :
		spec_instruction_srl_valid ? spec_instruction_srl_mem_wdata :
		spec_instruction_srli_valid ? spec_instruction_srli_mem_wdata :
		spec_instruction_sub_valid ? spec_instruction_sub_mem_wdata :
		spec_instruction_sw_valid ? spec_instruction_sw_mem_wdata :
		spec_instruction_xor_valid ? spec_instruction_xor_mem_wdata :
		spec_instruction_xori_valid ? spec_instruction_xori_mem_wdata : 0;
`ifdef RISCV_FORMAL_CSR_MISA
  assign spec_csr_misa_rmask =
		spec_instruction_add_valid ? spec_instruction_add_csr_misa_rmask :
		spec_instruction_addi_valid ? spec_instruction_addi_csr_misa_rmask :
		spec_instruction_and_valid ? spec_instruction_and_csr_misa_rmask :
		spec_instruction_andi_valid ? spec_instruction_andi_csr_misa_rmask :
		spec_instruction_auipc_valid ? spec_instruction_auipc_csr_misa_rmask :
		spec_instruction_beq_valid ? spec_instruction_beq_csr_misa_rmask :
		spec_instruction_bge_valid ? spec_instruction_bge_csr_misa_rmask :
		spec_instruction_bgeu_valid ? spec_instruction_bgeu_csr_misa_rmask :
		spec_instruction_blt_valid ? spec_instruction_blt_csr_misa_rmask :
		spec_instruction_bltu_valid ? spec_instruction_bltu_csr_misa_rmask :
		spec_instruction_bne_valid ? spec_instruction_bne_csr_misa_rmask :
		spec_instruction_c_add_valid ? spec_instruction_c_add_csr_misa_rmask :
		spec_instruction_c_addi_valid ? spec_instruction_c_addi_csr_misa_rmask :
		spec_instruction_c_addi16sp_valid ? spec_instruction_c_addi16sp_csr_misa_rmask :
		spec_instruction_c_addi4spn_valid ? spec_instruction_c_addi4spn_csr_misa_rmask :
		spec_instruction_c_and_valid ? spec_instruction_c_and_csr_misa_rmask :
		spec_instruction_c_andi_valid ? spec_instruction_c_andi_csr_misa_rmask :
		spec_instruction_c_beqz_valid ? spec_instruction_c_beqz_csr_misa_rmask :
		spec_instruction_c_bnez_valid ? spec_instruction_c_bnez_csr_misa_rmask :
		spec_instruction_c_j_valid ? spec_instruction_c_j_csr_misa_rmask :
		spec_instruction_c_jal_valid ? spec_instruction_c_jal_csr_misa_rmask :
		spec_instruction_c_jalr_valid ? spec_instruction_c_jalr_csr_misa_rmask :
		spec_instruction_c_jr_valid ? spec_instruction_c_jr_csr_misa_rmask :
		spec_instruction_c_li_valid ? spec_instruction_c_li_csr_misa_rmask :
		spec_instruction_c_lui_valid ? spec_instruction_c_lui_csr_misa_rmask :
		spec_instruction_c_lw_valid ? spec_instruction_c_lw_csr_misa_rmask :
		spec_instruction_c_lwsp_valid ? spec_instruction_c_lwsp_csr_misa_rmask :
		spec_instruction_c_mv_valid ? spec_instruction_c_mv_csr_misa_rmask :
		spec_instruction_c_or_valid ? spec_instruction_c_or_csr_misa_rmask :
		spec_instruction_c_slli_valid ? spec_instruction_c_slli_csr_misa_rmask :
		spec_instruction_c_srai_valid ? spec_instruction_c_srai_csr_misa_rmask :
		spec_instruction_c_srli_valid ? spec_instruction_c_srli_csr_misa_rmask :
		spec_instruction_c_sub_valid ? spec_instruction_c_sub_csr_misa_rmask :
		spec_instruction_c_sw_valid ? spec_instruction_c_sw_csr_misa_rmask :
		spec_instruction_c_swsp_valid ? spec_instruction_c_swsp_csr_misa_rmask :
		spec_instruction_c_xor_valid ? spec_instruction_c_xor_csr_misa_rmask :
		spec_instruction_jal_valid ? spec_instruction_jal_csr_misa_rmask :
		spec_instruction_jalr_valid ? spec_instruction_jalr_csr_misa_rmask :
		spec_instruction_lb_valid ? spec_instruction_lb_csr_misa_rmask :
		spec_instruction_lbu_valid ? spec_instruction_lbu_csr_misa_rmask :
		spec_instruction_lh_valid ? spec_instruction_lh_csr_misa_rmask :
		spec_instruction_lhu_valid ? spec_instruction_lhu_csr_misa_rmask :
		spec_instruction_lui_valid ? spec_instruction_lui_csr_misa_rmask :
		spec_instruction_lw_valid ? spec_instruction_lw_csr_misa_rmask :
		spec_instruction_or_valid ? spec_instruction_or_csr_misa_rmask :
		spec_instruction_ori_valid ? spec_instruction_ori_csr_misa_rmask :
		spec_instruction_sb_valid ? spec_instruction_sb_csr_misa_rmask :
		spec_instruction_sh_valid ? spec_instruction_sh_csr_misa_rmask :
		spec_instruction_sll_valid ? spec_instruction_sll_csr_misa_rmask :
		spec_instruction_slli_valid ? spec_instruction_slli_csr_misa_rmask :
		spec_instruction_slt_valid ? spec_instruction_slt_csr_misa_rmask :
		spec_instruction_slti_valid ? spec_instruction_slti_csr_misa_rmask :
		spec_instruction_sltiu_valid ? spec_instruction_sltiu_csr_misa_rmask :
		spec_instruction_sltu_valid ? spec_instruction_sltu_csr_misa_rmask :
		spec_instruction_sra_valid ? spec_instruction_sra_csr_misa_rmask :
		spec_instruction_srai_valid ? spec_instruction_srai_csr_misa_rmask :
		spec_instruction_srl_valid ? spec_instruction_srl_csr_misa_rmask :
		spec_instruction_srli_valid ? spec_instruction_srli_csr_misa_rmask :
		spec_instruction_sub_valid ? spec_instruction_sub_csr_misa_rmask :
		spec_instruction_sw_valid ? spec_instruction_sw_csr_misa_rmask :
		spec_instruction_xor_valid ? spec_instruction_xor_csr_misa_rmask :
		spec_instruction_xori_valid ? spec_instruction_xori_csr_misa_rmask : 0;
`endif
endmodule
