// Generated by hdl/cpu/riscv_formal/checks/gen_macros.py

`ifdef YOSYS
`define rvformal_rand_reg rand reg
`define rvformal_const_rand_reg const rand reg
`else
`ifdef SIMULATION
`define rvformal_rand_reg reg
`define rvformal_const_rand_reg reg
`else
`define rvformal_rand_reg wire
`define rvformal_const_rand_reg reg
`endif
`endif

`ifndef RISCV_FORMAL_VALIDADDR
`define RISCV_FORMAL_VALIDADDR(addr) 1
`endif

`define rvformal_addr_valid(a) (`RISCV_FORMAL_VALIDADDR(a))
`define rvformal_addr_eq(a, b) ((`rvformal_addr_valid(a) == `rvformal_addr_valid(b)) && (!`rvformal_addr_valid(a) || (a == b)))

`ifdef RISCV_FORMAL_CSR_FFLAGS
`define rvformal_csr_fflags_wires \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_rmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_wmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_rdata; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_wdata;
`define rvformal_csr_fflags_outputs , \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_rmask, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_wmask, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_rdata, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_wdata
`define rvformal_csr_fflags_inputs , \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_rmask, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_wmask, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_rdata, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fflags_wdata
`define rvformal_csr_fflags_channel(_idx) \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_fflags_rmask  = rvfi_csr_fflags_rmask  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_fflags_wmask  = rvfi_csr_fflags_wmask  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_fflags_rdata  = rvfi_csr_fflags_rdata  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_fflags_wdata  = rvfi_csr_fflags_wdata  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN];
`define rvformal_csr_fflags_conn , \
.rvfi_csr_fflags_rmask (rvfi_csr_fflags_rmask), \
.rvfi_csr_fflags_wmask (rvfi_csr_fflags_wmask), \
.rvfi_csr_fflags_rdata (rvfi_csr_fflags_rdata), \
.rvfi_csr_fflags_wdata (rvfi_csr_fflags_wdata)
`else
`define rvformal_csr_fflags_wires
`define rvformal_csr_fflags_outputs
`define rvformal_csr_fflags_inputs
`define rvformal_csr_fflags_channel(_idx)
`define rvformal_csr_fflags_conn
`endif

`ifdef RISCV_FORMAL_CSR_FRM
`define rvformal_csr_frm_wires \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_rmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_wmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_rdata; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_wdata;
`define rvformal_csr_frm_outputs , \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_rmask, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_wmask, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_rdata, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_wdata
`define rvformal_csr_frm_inputs , \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_rmask, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_wmask, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_rdata, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_frm_wdata
`define rvformal_csr_frm_channel(_idx) \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_frm_rmask  = rvfi_csr_frm_rmask  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_frm_wmask  = rvfi_csr_frm_wmask  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_frm_rdata  = rvfi_csr_frm_rdata  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_frm_wdata  = rvfi_csr_frm_wdata  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN];
`define rvformal_csr_frm_conn , \
.rvfi_csr_frm_rmask (rvfi_csr_frm_rmask), \
.rvfi_csr_frm_wmask (rvfi_csr_frm_wmask), \
.rvfi_csr_frm_rdata (rvfi_csr_frm_rdata), \
.rvfi_csr_frm_wdata (rvfi_csr_frm_wdata)
`else
`define rvformal_csr_frm_wires
`define rvformal_csr_frm_outputs
`define rvformal_csr_frm_inputs
`define rvformal_csr_frm_channel(_idx)
`define rvformal_csr_frm_conn
`endif

`ifdef RISCV_FORMAL_CSR_FCSR
`define rvformal_csr_fcsr_wires \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_rmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_wmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_rdata; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_wdata;
`define rvformal_csr_fcsr_outputs , \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_rmask, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_wmask, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_rdata, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_wdata
`define rvformal_csr_fcsr_inputs , \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_rmask, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_wmask, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_rdata, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_fcsr_wdata
`define rvformal_csr_fcsr_channel(_idx) \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_fcsr_rmask  = rvfi_csr_fcsr_rmask  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_fcsr_wmask  = rvfi_csr_fcsr_wmask  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_fcsr_rdata  = rvfi_csr_fcsr_rdata  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_fcsr_wdata  = rvfi_csr_fcsr_wdata  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN];
`define rvformal_csr_fcsr_conn , \
.rvfi_csr_fcsr_rmask (rvfi_csr_fcsr_rmask), \
.rvfi_csr_fcsr_wmask (rvfi_csr_fcsr_wmask), \
.rvfi_csr_fcsr_rdata (rvfi_csr_fcsr_rdata), \
.rvfi_csr_fcsr_wdata (rvfi_csr_fcsr_wdata)
`else
`define rvformal_csr_fcsr_wires
`define rvformal_csr_fcsr_outputs
`define rvformal_csr_fcsr_inputs
`define rvformal_csr_fcsr_channel(_idx)
`define rvformal_csr_fcsr_conn
`endif

`ifdef RISCV_FORMAL_CSR_MISA
`define rvformal_csr_misa_wires \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_rmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_wmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_rdata; \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_wdata;
`define rvformal_csr_misa_outputs , \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_rmask, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_wmask, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_rdata, \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_wdata
`define rvformal_csr_misa_inputs , \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_rmask, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_wmask, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_rdata, \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_misa_wdata
`define rvformal_csr_misa_channel(_idx) \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_misa_rmask  = rvfi_csr_misa_rmask  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_misa_wmask  = rvfi_csr_misa_wmask  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_misa_rdata  = rvfi_csr_misa_rdata  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN]; \
wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_misa_wdata  = rvfi_csr_misa_wdata  [(_idx)*`RISCV_FORMAL_XLEN  +: `RISCV_FORMAL_XLEN];
`define rvformal_csr_misa_conn , \
.rvfi_csr_misa_rmask (rvfi_csr_misa_rmask), \
.rvfi_csr_misa_wmask (rvfi_csr_misa_wmask), \
.rvfi_csr_misa_rdata (rvfi_csr_misa_rdata), \
.rvfi_csr_misa_wdata (rvfi_csr_misa_wdata)
`else
`define rvformal_csr_misa_wires
`define rvformal_csr_misa_outputs
`define rvformal_csr_misa_inputs
`define rvformal_csr_misa_channel(_idx)
`define rvformal_csr_misa_conn
`endif

`ifdef RISCV_FORMAL_CSR_TIME
`define rvformal_csr_time_wires \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_rmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_wmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_rdata; \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_wdata;
`define rvformal_csr_time_outputs , \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_rmask, \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_wmask, \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_rdata, \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_wdata
`define rvformal_csr_time_inputs , \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_rmask, \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_wmask, \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_rdata, \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_time_wdata
`define rvformal_csr_time_channel(_idx) \
wire [64 - 1 : 0] csr_time_rmask  = rvfi_csr_time_rmask  [(_idx)*64 +: 64]; \
wire [64 - 1 : 0] csr_time_wmask  = rvfi_csr_time_wmask  [(_idx)*64 +: 64]; \
wire [64 - 1 : 0] csr_time_rdata  = rvfi_csr_time_rdata  [(_idx)*64 +: 64]; \
wire [64 - 1 : 0] csr_time_wdata  = rvfi_csr_time_wdata  [(_idx)*64 +: 64];
`define rvformal_csr_time_conn , \
.rvfi_csr_time_rmask (rvfi_csr_time_rmask), \
.rvfi_csr_time_wmask (rvfi_csr_time_wmask), \
.rvfi_csr_time_rdata (rvfi_csr_time_rdata), \
.rvfi_csr_time_wdata (rvfi_csr_time_wdata)
`else
`define rvformal_csr_time_wires
`define rvformal_csr_time_outputs
`define rvformal_csr_time_inputs
`define rvformal_csr_time_channel(_idx)
`define rvformal_csr_time_conn
`endif

`ifdef RISCV_FORMAL_CSR_MCYCLE
`define rvformal_csr_mcycle_wires \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_rmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_wmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_rdata; \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_wdata;
`define rvformal_csr_mcycle_outputs , \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_rmask, \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_wmask, \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_rdata, \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_wdata
`define rvformal_csr_mcycle_inputs , \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_rmask, \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_wmask, \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_rdata, \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_mcycle_wdata
`define rvformal_csr_mcycle_channel(_idx) \
wire [64 - 1 : 0] csr_mcycle_rmask  = rvfi_csr_mcycle_rmask  [(_idx)*64 +: 64]; \
wire [64 - 1 : 0] csr_mcycle_wmask  = rvfi_csr_mcycle_wmask  [(_idx)*64 +: 64]; \
wire [64 - 1 : 0] csr_mcycle_rdata  = rvfi_csr_mcycle_rdata  [(_idx)*64 +: 64]; \
wire [64 - 1 : 0] csr_mcycle_wdata  = rvfi_csr_mcycle_wdata  [(_idx)*64 +: 64];
`define rvformal_csr_mcycle_conn , \
.rvfi_csr_mcycle_rmask (rvfi_csr_mcycle_rmask), \
.rvfi_csr_mcycle_wmask (rvfi_csr_mcycle_wmask), \
.rvfi_csr_mcycle_rdata (rvfi_csr_mcycle_rdata), \
.rvfi_csr_mcycle_wdata (rvfi_csr_mcycle_wdata)
`else
`define rvformal_csr_mcycle_wires
`define rvformal_csr_mcycle_outputs
`define rvformal_csr_mcycle_inputs
`define rvformal_csr_mcycle_channel(_idx)
`define rvformal_csr_mcycle_conn
`endif

`ifdef RISCV_FORMAL_CSR_MINSTRET
`define rvformal_csr_minstret_wires \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_rmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_wmask; \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_rdata; \
(* keep *) wire [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_wdata;
`define rvformal_csr_minstret_outputs , \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_rmask, \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_wmask, \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_rdata, \
output [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_wdata
`define rvformal_csr_minstret_inputs , \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_rmask, \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_wmask, \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_rdata, \
input [`RISCV_FORMAL_NRET * 64 - 1 : 0] rvfi_csr_minstret_wdata
`define rvformal_csr_minstret_channel(_idx) \
wire [64 - 1 : 0] csr_minstret_rmask  = rvfi_csr_minstret_rmask  [(_idx)*64 +: 64]; \
wire [64 - 1 : 0] csr_minstret_wmask  = rvfi_csr_minstret_wmask  [(_idx)*64 +: 64]; \
wire [64 - 1 : 0] csr_minstret_rdata  = rvfi_csr_minstret_rdata  [(_idx)*64 +: 64]; \
wire [64 - 1 : 0] csr_minstret_wdata  = rvfi_csr_minstret_wdata  [(_idx)*64 +: 64];
`define rvformal_csr_minstret_conn , \
.rvfi_csr_minstret_rmask (rvfi_csr_minstret_rmask), \
.rvfi_csr_minstret_wmask (rvfi_csr_minstret_wmask), \
.rvfi_csr_minstret_rdata (rvfi_csr_minstret_rdata), \
.rvfi_csr_minstret_wdata (rvfi_csr_minstret_wdata)
`else
`define rvformal_csr_minstret_wires
`define rvformal_csr_minstret_outputs
`define rvformal_csr_minstret_inputs
`define rvformal_csr_minstret_channel(_idx)
`define rvformal_csr_minstret_conn
`endif

`ifdef RISCV_FORMAL_EXTAMO
`define rvformal_extamo_wires          (* keep *) wire [`RISCV_FORMAL_NRET-1:0] rvfi_mem_extamo;
`define rvformal_extamo_outputs        , output [`RISCV_FORMAL_NRET-1:0] rvfi_mem_extamo
`define rvformal_extamo_inputs         , input [`RISCV_FORMAL_NRET-1:0] rvfi_mem_extamo
`define rvformal_extamo_channel(_idx)  wire mem_extamo  = rvfi_mem_extamo [_idx];
`define rvformal_extamo_conn           , .rvfi_mem_extamo(rvfi_mem_extamo)
`else
`define rvformal_extamo_wires
`define rvformal_extamo_outputs
`define rvformal_extamo_inputs
`define rvformal_extamo_channel(_idx)
`define rvformal_extamo_conn
`endif

`define RVFI_WIRES                                                                   \
(* keep *) wire [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_valid;      \
(* keep *) wire [`RISCV_FORMAL_NRET *                 64   - 1 : 0] rvfi_order;      \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_ILEN   - 1 : 0] rvfi_instruction;\
(* keep *) wire [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_trap;       \
(* keep *) wire [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_halt;       \
(* keep *) wire [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_intr;       \
(* keep *) wire [`RISCV_FORMAL_NRET *                  2   - 1 : 0] rvfi_mode;       \
(* keep *) wire [`RISCV_FORMAL_NRET *                  2   - 1 : 0] rvfi_ixl;        \
(* keep *) wire [`RISCV_FORMAL_NRET *                  5   - 1 : 0] rvfi_rs1_addr;   \
(* keep *) wire [`RISCV_FORMAL_NRET *                  5   - 1 : 0] rvfi_rs2_addr;   \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs1_rdata;  \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs2_rdata;  \
(* keep *) wire [`RISCV_FORMAL_NRET *                  5   - 1 : 0] rvfi_rd_addr;    \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rd_wdata;   \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_rdata;   \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_wdata;   \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_addr;   \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN/8 - 1 : 0] rvfi_mem_rmask;  \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN/8 - 1 : 0] rvfi_mem_wmask;  \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_rdata;  \
(* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_wdata;  \
`rvformal_extamo_wires \
`rvformal_csr_fflags_wires \
`rvformal_csr_frm_wires \
`rvformal_csr_fcsr_wires \
`rvformal_csr_misa_wires \
`rvformal_csr_time_wires \
`rvformal_csr_mcycle_wires \
`rvformal_csr_minstret_wires

`define RVFI_OUTPUTS                                                        \
output [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_valid,      \
output [`RISCV_FORMAL_NRET *                 64   - 1 : 0] rvfi_order,      \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_ILEN   - 1 : 0] rvfi_instruction,\
output [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_trap,       \
output [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_halt,       \
output [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_intr,       \
output [`RISCV_FORMAL_NRET *                  2   - 1 : 0] rvfi_mode,       \
output [`RISCV_FORMAL_NRET *                  2   - 1 : 0] rvfi_ixl,        \
output [`RISCV_FORMAL_NRET *                  5   - 1 : 0] rvfi_rs1_addr,   \
output [`RISCV_FORMAL_NRET *                  5   - 1 : 0] rvfi_rs2_addr,   \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs1_rdata,  \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs2_rdata,  \
output [`RISCV_FORMAL_NRET *                  5   - 1 : 0] rvfi_rd_addr,    \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rd_wdata,   \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_rdata,   \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_wdata,   \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_addr,   \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN/8 - 1 : 0] rvfi_mem_rmask,  \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN/8 - 1 : 0] rvfi_mem_wmask,  \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_rdata,  \
output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_wdata   \
`rvformal_extamo_outputs \
`rvformal_csr_fflags_outputs \
`rvformal_csr_frm_outputs \
`rvformal_csr_fcsr_outputs \
`rvformal_csr_misa_outputs \
`rvformal_csr_time_outputs \
`rvformal_csr_mcycle_outputs \
`rvformal_csr_minstret_outputs

`define RVFI_INPUTS                                                        \
input [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_valid,      \
input [`RISCV_FORMAL_NRET *                 64   - 1 : 0] rvfi_order,      \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_ILEN   - 1 : 0] rvfi_instruction,\
input [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_trap,       \
input [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_halt,       \
input [`RISCV_FORMAL_NRET                        - 1 : 0] rvfi_intr,       \
input [`RISCV_FORMAL_NRET *                  2   - 1 : 0] rvfi_mode,       \
input [`RISCV_FORMAL_NRET *                  2   - 1 : 0] rvfi_ixl,        \
input [`RISCV_FORMAL_NRET *                  5   - 1 : 0] rvfi_rs1_addr,   \
input [`RISCV_FORMAL_NRET *                  5   - 1 : 0] rvfi_rs2_addr,   \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs1_rdata,  \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs2_rdata,  \
input [`RISCV_FORMAL_NRET *                  5   - 1 : 0] rvfi_rd_addr,    \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rd_wdata,   \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_rdata,   \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_wdata,   \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_addr,   \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN/8 - 1 : 0] rvfi_mem_rmask,  \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN/8 - 1 : 0] rvfi_mem_wmask,  \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_rdata,  \
input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_wdata   \
`rvformal_extamo_inputs \
`rvformal_csr_fflags_inputs \
`rvformal_csr_frm_inputs \
`rvformal_csr_fcsr_inputs \
`rvformal_csr_misa_inputs \
`rvformal_csr_time_inputs \
`rvformal_csr_mcycle_inputs \
`rvformal_csr_minstret_inputs

`define RVFI_CHANNEL(_name, _idx) \
generate if(1) begin:_name \
wire [                 1   - 1 : 0] valid       = rvfi_valid      [(_idx)*(                 1  )  +:                  1  ]; \
wire [                64   - 1 : 0] order       = rvfi_order      [(_idx)*(                64  )  +:                 64  ]; \
wire [`RISCV_FORMAL_ILEN   - 1 : 0] instruction = rvfi_instruction[(_idx)*(`RISCV_FORMAL_ILEN  )  +: `RISCV_FORMAL_ILEN  ]; \
wire [                 1   - 1 : 0] trap        = rvfi_trap       [(_idx)*(                 1  )  +:                  1  ]; \
wire [                 1   - 1 : 0] halt        = rvfi_halt       [(_idx)*(                 1  )  +:                  1  ]; \
wire [                 1   - 1 : 0] intr        = rvfi_intr       [(_idx)*(                 1  )  +:                  1  ]; \
wire [                 2   - 1 : 0] mode        = rvfi_mode       [(_idx)*(                 2  )  +:                  2  ]; \
wire [                 2   - 1 : 0] ixl         = rvfi_ixl        [(_idx)*(                 2  )  +:                  2  ]; \
wire [                 5   - 1 : 0] rs1_addr    = rvfi_rs1_addr   [(_idx)*(                 5  )  +:                  5  ]; \
wire [                 5   - 1 : 0] rs2_addr    = rvfi_rs2_addr   [(_idx)*(                 5  )  +:                  5  ]; \
wire [`RISCV_FORMAL_XLEN   - 1 : 0] rs1_rdata   = rvfi_rs1_rdata  [(_idx)*(`RISCV_FORMAL_XLEN  )  +: `RISCV_FORMAL_XLEN  ]; \
wire [`RISCV_FORMAL_XLEN   - 1 : 0] rs2_rdata   = rvfi_rs2_rdata  [(_idx)*(`RISCV_FORMAL_XLEN  )  +: `RISCV_FORMAL_XLEN  ]; \
wire [                 5   - 1 : 0] rd_addr     = rvfi_rd_addr    [(_idx)*(                 5  )  +:                  5  ]; \
wire [`RISCV_FORMAL_XLEN   - 1 : 0] rd_wdata    = rvfi_rd_wdata   [(_idx)*(`RISCV_FORMAL_XLEN  )  +: `RISCV_FORMAL_XLEN  ]; \
wire [`RISCV_FORMAL_XLEN   - 1 : 0] pc_rdata    = rvfi_pc_rdata   [(_idx)*(`RISCV_FORMAL_XLEN  )  +: `RISCV_FORMAL_XLEN  ]; \
wire [`RISCV_FORMAL_XLEN   - 1 : 0] pc_wdata    = rvfi_pc_wdata   [(_idx)*(`RISCV_FORMAL_XLEN  )  +: `RISCV_FORMAL_XLEN  ]; \
wire [`RISCV_FORMAL_XLEN   - 1 : 0] mem_addr    = rvfi_mem_addr   [(_idx)*(`RISCV_FORMAL_XLEN  )  +: `RISCV_FORMAL_XLEN  ]; \
wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] mem_rmask   = rvfi_mem_rmask  [(_idx)*(`RISCV_FORMAL_XLEN/8)  +: `RISCV_FORMAL_XLEN/8]; \
wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] mem_wmask   = rvfi_mem_wmask  [(_idx)*(`RISCV_FORMAL_XLEN/8)  +: `RISCV_FORMAL_XLEN/8]; \
wire [`RISCV_FORMAL_XLEN   - 1 : 0] mem_rdata   = rvfi_mem_rdata  [(_idx)*(`RISCV_FORMAL_XLEN  )  +: `RISCV_FORMAL_XLEN  ]; \
wire [`RISCV_FORMAL_XLEN   - 1 : 0] mem_wdata   = rvfi_mem_wdata  [(_idx)*(`RISCV_FORMAL_XLEN  )  +: `RISCV_FORMAL_XLEN  ]; \
`rvformal_extamo_channel(_idx) \
`rvformal_csr_fflags_channel(_idx) \
`rvformal_csr_frm_channel(_idx) \
`rvformal_csr_fcsr_channel(_idx) \
`rvformal_csr_misa_channel(_idx) \
`rvformal_csr_time_channel(_idx) \
`rvformal_csr_mcycle_channel(_idx) \
`rvformal_csr_minstret_channel(_idx) \
end endgenerate

`define RVFI_CONN                      \
.rvfi_valid       (rvfi_valid      ),  \
.rvfi_order       (rvfi_order      ),  \
.rvfi_instruction (rvfi_instruction),  \
.rvfi_trap        (rvfi_trap       ),  \
.rvfi_halt        (rvfi_halt       ),  \
.rvfi_intr        (rvfi_intr       ),  \
.rvfi_mode        (rvfi_mode       ),  \
.rvfi_ixl         (rvfi_ixl        ),  \
.rvfi_rs1_addr    (rvfi_rs1_addr   ),  \
.rvfi_rs2_addr    (rvfi_rs2_addr   ),  \
.rvfi_rs1_rdata   (rvfi_rs1_rdata  ),  \
.rvfi_rs2_rdata   (rvfi_rs2_rdata  ),  \
.rvfi_rd_addr     (rvfi_rd_addr    ),  \
.rvfi_rd_wdata    (rvfi_rd_wdata   ),  \
.rvfi_pc_rdata    (rvfi_pc_rdata   ),  \
.rvfi_pc_wdata    (rvfi_pc_wdata   ),  \
.rvfi_mem_addr    (rvfi_mem_addr   ),  \
.rvfi_mem_rmask   (rvfi_mem_rmask  ),  \
.rvfi_mem_wmask   (rvfi_mem_wmask  ),  \
.rvfi_mem_rdata   (rvfi_mem_rdata  ),  \
.rvfi_mem_wdata   (rvfi_mem_wdata  )   \
`rvformal_extamo_conn \
`rvformal_csr_fflags_conn \
`rvformal_csr_frm_conn \
`rvformal_csr_fcsr_conn \
`rvformal_csr_misa_conn \
`rvformal_csr_time_conn \
`rvformal_csr_mcycle_conn \
`rvformal_csr_minstret_conn
