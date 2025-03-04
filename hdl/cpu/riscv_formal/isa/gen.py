#!/usr/bin/env python3
#
# Copyright (C) 2017  Clifford Wolf <clifford@symbioticeda.com>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


import os.path
import sys


output_prefix = sys.argv[1] if len(sys.argv) > 1 else ""

current_isa = []
isa_database = dict()
defaults_cache = None

MISA_A = 1 <<  0 # Atomic
MISA_B = 1 <<  1 # -reserved-
MISA_C = 1 <<  2 # Compressed
MISA_D = 1 <<  3 # Double-precision float
MISA_E = 1 <<  4 # RV32E base ISA
MISA_F = 1 <<  5 # Single-precision float
MISA_G = 1 <<  6 # Additional std extensions
MISA_H = 1 <<  7 # -reserved-
MISA_I = 1 <<  8 # RV32I/RV64I/RV128I base ISA
MISA_J = 1 <<  9 # -reserved-
MISA_K = 1 << 10 # -reserved-
MISA_L = 1 << 11 # -reserved-
MISA_M = 1 << 12 # Muliply/Divide
MISA_N = 1 << 13 # User-level interrupts
MISA_O = 1 << 14 # -reserved-
MISA_P = 1 << 15 # -reserved-
MISA_Q = 1 << 16 # Quad-precision float
MISA_R = 1 << 17 # -reserved-
MISA_S = 1 << 18 # Supervisor mode
MISA_T = 1 << 19 # -reserved-
MISA_U = 1 << 20 # User mode
MISA_V = 1 << 21 # -reserved-
MISA_W = 1 << 22 # -reserved-
MISA_X = 1 << 23 # Non-std extensions
MISA_Y = 1 << 24 # -reserved-
MISA_Z = 1 << 25 # -reserved-

def header(f, instruction, isa_mode=False):
    if not isa_mode:
        global isa_database
        for isa in current_isa:
            if isa not in isa_database:
                isa_database[isa] = set()
            isa_database[isa].add(instruction)

    global defaults_cache
    defaults_cache = dict()

    print("// DO NOT EDIT -- auto-generated from hdl/cpu/riscv_formal/isa/gen.py", file=f)
    print("", file=f)
    if isa_mode:
        print("module rvfi_isa_%s (" % instruction, file=f)
    else:
        print("module rvfi_instruction_%s (" % instruction, file=f)

    print("  input                                 rvfi_valid,", file=f)
    print("  input  [`RISCV_FORMAL_ILEN   - 1 : 0] rvfi_instruction,", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_rdata,", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs1_rdata,", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs2_rdata,", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_rdata,", file=f)

    print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_csr_misa_rdata,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_csr_misa_rmask,", file=f)
    print("`endif", file=f)

    print("", file=f)
    print("  output                                spec_valid,", file=f)
    print("  output                                spec_trap,", file=f)
    print("  output [                       4 : 0] spec_rs1_addr,", file=f)
    print("  output [                       4 : 0] spec_rs2_addr,", file=f)
    print("  output [                       4 : 0] spec_rd_addr,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_rd_wdata,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_pc_wdata,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_addr,", file=f)
    print("  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_rmask,", file=f)
    print("  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_wmask,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_wdata", file=f)

    print(");", file=f)

    defaults_cache["spec_valid"] = "0"
    defaults_cache["spec_rs1_addr"] = "0"
    defaults_cache["spec_rs2_addr"] = "0"
    defaults_cache["spec_rd_addr"] = "0"
    defaults_cache["spec_rd_wdata"] = "0"
    defaults_cache["spec_pc_wdata"] = "0"
    defaults_cache["spec_trap"] = "!misa_ok"
    defaults_cache["spec_mem_addr"] = "0"
    defaults_cache["spec_mem_rmask"] = "0"
    defaults_cache["spec_mem_wmask"] = "0"
    defaults_cache["spec_mem_wdata"] = "0"

def assign(f, sig, val):
    print("  assign %s = %s;" % (sig, val), file=f)

    if sig in defaults_cache:
        del defaults_cache[sig]

def misa_check(f, mask, ialign16=False):
    print("", file=f)
    print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
    print("  wire misa_ok = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h %x) == `RISCV_FORMAL_XLEN'h %x;" % (mask, mask), file=f)
    print("  assign spec_csr_misa_rmask = `RISCV_FORMAL_XLEN'h %x;" % ((mask|MISA_C) if ialign16 else mask), file=f)
    if ialign16:
        print("  wire ialign16 = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h %x) != `RISCV_FORMAL_XLEN'h 0;" % (MISA_C), file=f)
    print("`else", file=f)
    print("  wire misa_ok = 1;", file=f)
    if ialign16:
        print("`ifdef RISCV_FORMAL_COMPRESSED", file=f)
        print("  wire ialign16 = 1;", file=f)
        print("`else", file=f)
        print("  wire ialign16 = 0;", file=f)
        print("`endif", file=f)
    print("`endif", file=f)

def footer(f):
    def default_assign(sig):
        if sig in defaults_cache:
            print("  assign %s = %s;" % (sig, defaults_cache[sig]), file=f)

    if len(defaults_cache) != 0:
        print("", file=f)
        print("  // default assignments", file=f)

        default_assign("spec_valid")
        default_assign("spec_rs1_addr")
        default_assign("spec_rs2_addr")
        default_assign("spec_rd_addr")
        default_assign("spec_rd_wdata")
        default_assign("spec_pc_wdata")
        default_assign("spec_trap")
        default_assign("spec_mem_addr")
        default_assign("spec_mem_rmask")
        default_assign("spec_mem_wmask")
        default_assign("spec_mem_wdata")

    print("endmodule", file=f)

def format_r(f):
    print("", file=f)
    print("  // R-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;", file=f)
    print("  wire [6:0] instruction_funct7 = rvfi_instruction[31:25];", file=f)
    print("  wire [4:0] instruction_rs2    = rvfi_instruction[24:20];", file=f)
    print("  wire [4:0] instruction_rs1    = rvfi_instruction[19:15];", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[14:12];", file=f)
    print("  wire [4:0] instruction_rd     = rvfi_instruction[11: 7];", file=f)
    print("  wire [6:0] instruction_opcode = rvfi_instruction[ 6: 0];", file=f)

def format_ra(f):
    print("", file=f)
    print("  // R-type instruction format (atomics variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;", file=f)
    print("  wire [6:0] instruction_funct5 = rvfi_instruction[31:27];", file=f)
    print("  wire       instruction_aq     = rvfi_instruction[26];", file=f)
    print("  wire       instruction_rl     = rvfi_instruction[25];", file=f)
    print("  wire [4:0] instruction_rs2    = rvfi_instruction[24:20];", file=f)
    print("  wire [4:0] instruction_rs1    = rvfi_instruction[19:15];", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[14:12];", file=f)
    print("  wire [4:0] instruction_rd     = rvfi_instruction[11: 7];", file=f)
    print("  wire [6:0] instruction_opcode = rvfi_instruction[ 6: 0];", file=f)

def format_i(f):
    print("", file=f)
    print("  // I-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed(rvfi_instruction[31:20]);", file=f)
    print("  wire [4:0] instruction_rs1    = rvfi_instruction[19:15];", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[14:12];", file=f)
    print("  wire [4:0] instruction_rd     = rvfi_instruction[11: 7];", file=f)
    print("  wire [6:0] instruction_opcode = rvfi_instruction[ 6: 0];", file=f)

def format_i_shift(f):
    print("", file=f)
    print("  // I-type instruction format (shift variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;", file=f)
    print("  wire [6:0] instruction_funct6 = rvfi_instruction[31:26];", file=f)
    print("  wire [5:0] instruction_shamt  = rvfi_instruction[25:20];", file=f)
    print("  wire [4:0] instruction_rs1    = rvfi_instruction[19:15];", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[14:12];", file=f)
    print("  wire [4:0] instruction_rd     = rvfi_instruction[11: 7];", file=f)
    print("  wire [6:0] instruction_opcode = rvfi_instruction[ 6: 0];", file=f)

def format_s(f):
    print("", file=f)
    print("  // S-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[31:25], rvfi_instruction[11:7]});", file=f)
    print("  wire [4:0] instruction_rs2    = rvfi_instruction[24:20];", file=f)
    print("  wire [4:0] instruction_rs1    = rvfi_instruction[19:15];", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[14:12];", file=f)
    print("  wire [6:0] instruction_opcode = rvfi_instruction[ 6: 0];", file=f)

def format_sb(f):
    print("", file=f)
    print("  // SB-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[31], rvfi_instruction[7], rvfi_instruction[30:25], rvfi_instruction[11:8], 1'b0});", file=f)
    print("  wire [4:0] instruction_rs2    = rvfi_instruction[24:20];", file=f)
    print("  wire [4:0] instruction_rs1    = rvfi_instruction[19:15];", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[14:12];", file=f)
    print("  wire [6:0] instruction_opcode = rvfi_instruction[ 6: 0];", file=f)

def format_u(f):
    print("", file=f)
    print("  // U-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[31:12], 12'b0});", file=f)
    print("  wire [4:0] instruction_rd     = rvfi_instruction[11:7];", file=f)
    print("  wire [6:0] instruction_opcode = rvfi_instruction[ 6:0];", file=f)

def format_uj(f):
    print("", file=f)
    print("  // UJ-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 32;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[31], rvfi_instruction[19:12], rvfi_instruction[20], rvfi_instruction[30:21], 1'b0});", file=f)
    print("  wire [4:0] instruction_rd     = rvfi_instruction[11:7];", file=f)
    print("  wire [6:0] instruction_opcode = rvfi_instruction[6:0];", file=f)

def format_cr(f):
    print("", file=f)
    print("  // CI-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [3:0] instruction_funct4 = rvfi_instruction[15:12];", file=f)
    print("  wire [4:0] instruction_rs1_rd = rvfi_instruction[11:7];", file=f)
    print("  wire [4:0] instruction_rs2 = rvfi_instruction[6:2];", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_ci(f):
    print("", file=f)
    print("  // CI-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[12], rvfi_instruction[6:2]});", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rs1_rd = rvfi_instruction[11:7];", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_ci_sp(f):
    print("", file=f)
    print("  // CI-type instruction format (SP variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[12], rvfi_instruction[4:3], rvfi_instruction[5], rvfi_instruction[2], rvfi_instruction[6], 4'b0});", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rs1_rd = rvfi_instruction[11:7];", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_ci_lui(f):
    print("", file=f)
    print("  // CI-type instruction format (LUI variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[12], rvfi_instruction[6:2], 12'b0});", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rs1_rd = rvfi_instruction[11:7];", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_ci_sri(f):
    print("", file=f)
    print("  // CI-type instruction format (SRI variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [5:0] instruction_shamt = {rvfi_instruction[12], rvfi_instruction[6:2]};", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [1:0] instruction_funct2 = rvfi_instruction[11:10];", file=f)
    print("  wire [4:0] instruction_rs1_rd = {1'b1, rvfi_instruction[9:7]};", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_ci_sli(f):
    print("", file=f)
    print("  // CI-type instruction format (SLI variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [5:0] instruction_shamt = {rvfi_instruction[12], rvfi_instruction[6:2]};", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rs1_rd = rvfi_instruction[11:7];", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_ci_andi(f):
    print("", file=f)
    print("  // CI-type instruction format (ANDI variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[12], rvfi_instruction[6:2]});", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [1:0] instruction_funct2 = rvfi_instruction[11:10];", file=f)
    print("  wire [4:0] instruction_rs1_rd = {1'b1, rvfi_instruction[9:7]};", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_ci_lsp(f, numbytes):
    print("", file=f)
    print("  // CI-type instruction format (LSP variation, %d bit version)" % (8*numbytes), file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    if numbytes == 4:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = {rvfi_instruction[3:2], rvfi_instruction[12], rvfi_instruction[6:4], 2'b00};", file=f)
    elif numbytes == 8:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = {rvfi_instruction[4:2], rvfi_instruction[12], rvfi_instruction[6:5], 3'b000};", file=f)
    else:
        assert False
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rd = rvfi_instruction[11:7];", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_cl(f, numbytes):
    print("", file=f)
    print("  // CL-type instruction format (%d bit version)" % (8*numbytes), file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    if numbytes == 4:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = {rvfi_instruction[5], rvfi_instruction[12:10], rvfi_instruction[6], 2'b00};", file=f)
    elif numbytes == 8:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = {rvfi_instruction[6:5], rvfi_instruction[12:10], 3'b000};", file=f)
    else:
        assert False
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rs1 = {1'b1, rvfi_instruction[9:7]};", file=f)
    print("  wire [4:0] instruction_rd = {1'b1, rvfi_instruction[4:2]};", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_css(f, numbytes):
    print("", file=f)
    print("  // CSS-type instruction format (%d bit version)" % (8*numbytes), file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    if numbytes == 4:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = {rvfi_instruction[8:7], rvfi_instruction[12:9], 2'b00};", file=f)
    elif numbytes == 8:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = {rvfi_instruction[9:7], rvfi_instruction[12:10], 3'b000};", file=f)
    else:
        assert False
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rs2 = rvfi_instruction[6:2];", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_cs(f, numbytes):
    print("", file=f)
    print("  // CS-type instruction format (%d bit version)" % (8*numbytes), file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    if numbytes == 4:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = {rvfi_instruction[5], rvfi_instruction[12:10], rvfi_instruction[6], 2'b00};", file=f)
    elif numbytes == 8:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = {rvfi_instruction[6:5], rvfi_instruction[12:10], 3'b000};", file=f)
    else:
        assert False
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rs1 = {1'b1, rvfi_instruction[9:7]};", file=f)
    print("  wire [4:0] instruction_rs2 = {1'b1, rvfi_instruction[4:2]};", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_cs_alu(f):
    print("", file=f)
    print("  // CS-type instruction format (ALU version)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [5:0] instruction_funct6 = rvfi_instruction[15:10];", file=f)
    print("  wire [1:0] instruction_funct2 = rvfi_instruction[6:5];", file=f)
    print("  wire [4:0] instruction_rs1_rd = {1'b1, rvfi_instruction[9:7]};", file=f)
    print("  wire [4:0] instruction_rs2 = {1'b1, rvfi_instruction[4:2]};", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_ciw(f):
    print("", file=f)
    print("  // CIW-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = {rvfi_instruction[10:7], rvfi_instruction[12:11], rvfi_instruction[5], rvfi_instruction[6], 2'b00};", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rd = {1'b1, rvfi_instruction[4:2]};", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_cb(f):
    print("", file=f)
    print("  // CB-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[12], rvfi_instruction[6:5], rvfi_instruction[2], rvfi_instruction[11:10], rvfi_instruction[4:3], 1'b0});", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [4:0] instruction_rs1 = {1'b1, rvfi_instruction[9:7]};", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def format_cj(f):
    print("", file=f)
    print("  // CJ-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] instruction_padding = rvfi_instruction >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] instruction_imm = $signed({rvfi_instruction[12], rvfi_instruction[8], rvfi_instruction[10], rvfi_instruction[9],", file=f)
    print("      rvfi_instruction[6], rvfi_instruction[7], rvfi_instruction[2], rvfi_instruction[11], rvfi_instruction[5], rvfi_instruction[4], rvfi_instruction[3], 1'b0});", file=f)
    print("  wire [2:0] instruction_funct3 = rvfi_instruction[15:13];", file=f)
    print("  wire [1:0] instruction_opcode = rvfi_instruction[1:0];", file=f)

def lui(instruction="lui", misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_u(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_opcode == 7'b 0110111")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? instruction_imm : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")

        footer(f)

def auipc(instruction="auipc", misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_u(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_opcode == 7'b 0010111")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? rvfi_pc_rdata + instruction_imm : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")

        footer(f)

def jal(instruction="jal", misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_uj(f)
        misa_check(f, misa,  ialign16=True)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = rvfi_pc_rdata + instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_opcode == 7'b 1101111")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? rvfi_pc_rdata + 4 : 0")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok")

        footer(f)

def jalr(instruction="jalr", misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_i(f)
        misa_check(f, misa, ialign16=True)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = (rvfi_rs1_rdata + instruction_imm) & ~1;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 000 && instruction_opcode == 7'b 1100111")
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? rvfi_pc_rdata + 4 : 0")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok")

        footer(f)

def b(instruction, funct3, expr, misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_sb(f)
        misa_check(f, misa, ialign16=True)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire cond = %s;" % expr, file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = cond ? rvfi_pc_rdata + instruction_imm : rvfi_pc_rdata + 4;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 7'b 1100011" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok")

        footer(f)

def l(instruction, funct3, numbytes, signext, misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_i(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 7'b 0000011" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_rmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata;" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && instruction_funct3 == 3'b %s && instruction_opcode == 7'b 0000011" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_rmask", "((1 << %d)-1)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def s(instruction, funct3, numbytes, misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_s(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 7'b 0100011" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 7'b 0100011" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_wmask", "((1 << %d)-1)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def imm(instruction, funct3, expr, wmode=False, misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_i(f)
        misa_check(f, misa)

        if wmode:
            result_range = "31:0"
            opcode = "0011011"
        else:
            result_range = "`RISCV_FORMAL_XLEN-1:0"
            opcode = "0010011"

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [%s] result = %s;" % (result_range, expr), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 7'b %s" % (funct3, opcode))
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rd_addr", "instruction_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")

        footer(f)

def shimm(instruction, funct6, funct3, expr, wmode=False, misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_i_shift(f)
        misa_check(f, misa)

        if wmode:
            xtra_shamt_check = "!instruction_shamt[5]"
            result_range = "31:0"
            opcode = "0011011"
        else:
            xtra_shamt_check = "(!instruction_shamt[5] || `RISCV_FORMAL_XLEN == 64)"
            result_range = "`RISCV_FORMAL_XLEN-1:0"
            opcode = "0010011"

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [%s] result = %s;" % (result_range, expr), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct6 == 6'b %s && instruction_funct3 == 3'b %s && instruction_opcode == 7'b %s && %s" % (funct6, funct3, opcode, xtra_shamt_check))
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rd_addr", "instruction_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")

        footer(f)

def alu(instruction, funct7, funct3, expr, alt_add=None, alt_sub=None, shamt=False, wmode=False, misa=0):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_r(f)
        misa_check(f, misa)

        if wmode:
            result_range = "31:0"
            opcode = "0111011"
        else:
            result_range = "`RISCV_FORMAL_XLEN-1:0"
            opcode = "0110011"

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        if shamt:
            if wmode:
                print("  wire [4:0] shamt = rvfi_rs2_rdata[4:0];", file=f)
            else:
                print("  wire [5:0] shamt = `RISCV_FORMAL_XLEN == 64 ? rvfi_rs2_rdata[5:0] : rvfi_rs2_rdata[4:0];", file=f)
        if alt_add is not None or alt_sub is not None:
            print("`ifdef RISCV_FORMAL_ALTOPS", file=f)
            if alt_add is not None:
                print("  wire [%s] altops_bitmask = 64'h%016x;" % (result_range, alt_add), file=f)
                print("  wire [%s] result = (rvfi_rs1_rdata + rvfi_rs2_rdata) ^ altops_bitmask;" % result_range, file=f)
            else:
                print("  wire [%s] altops_bitmask = 64'h%016x;" % (result_range, alt_sub), file=f)
                print("  wire [%s] result = (rvfi_rs1_rdata - rvfi_rs2_rdata) ^ altops_bitmask;" % result_range, file=f)
            print("`else", file=f)
            print("  wire [%s] result = %s;" % (result_range, expr), file=f)
            print("`endif", file=f)
        else:
            print("  wire [%s] result = %s;" % (result_range, expr), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct7 == 7'b %s && instruction_funct3 == 3'b %s && instruction_opcode == 7'b %s" % (funct7, funct3, opcode))
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_rd_addr", "instruction_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")

        footer(f)

def amo(instruction, funct5, funct3, expr, misa=MISA_A):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ra(f)
        misa_check(f, misa)

        if funct3 == "010":
            oprange = "31:0"
            numbytes = 4
        else:
            oprange = "63:0"
            numbytes = 8

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [%s] mem_result = %s;" % (oprange, expr), file=f)
        print("  wire [%s] reg_result = rvfi_mem_rdata[%s];" % (oprange, oprange), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata;", file=f)

        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct5 == 5'b %s && instruction_funct3 == 3'b %s && instruction_opcode == 7'b 0101111" % (funct5, funct3))
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(reg_result) : 0")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        assign(f, "spec_mem_wdata", "mem_result << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct5 == 5'b %s && instruction_funct3 == 3'b %s && instruction_opcode == 7'b 0101111" % (funct5, funct3))
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(reg_result) : 0")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_wmask", "((1 << %d)-1)" % numbytes)
        assign(f, "spec_mem_wdata", "mem_result")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`endif", file=f)

        footer(f)

def c_addi4spn(instruction="c_addi4spn", misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ciw(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 000 && instruction_opcode == 2'b 00 && instruction_imm")
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def c_l(instruction, funct3, numbytes, signext, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_cl(f, numbytes)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 00" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_rmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata;" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 00" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_rmask", "((1 << %d)-1)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def c_s(instruction, funct3, numbytes, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_cs(f, numbytes)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 00" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 00" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_wmask", "((1 << %d)-1)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def c_addi(instruction="c_addi", wmode=False, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ci(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        if wmode:
            print("  wire [31:0] result = rvfi_rs1_rdata[31:0] + instruction_imm[31:0];", file=f)
            assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 001 && instruction_opcode == 2'b 01 && instruction_rs1_rd != 5'd 0")
        else:
            print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + instruction_imm;", file=f)
            assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 000 && instruction_opcode == 2'b 01")
        assign(f, "spec_rs1_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_addr", "instruction_rs1_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def c_jal(instruction, funct3, link, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_cj(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = rvfi_pc_rdata + instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 01" % (funct3))
        if link:
            assign(f, "spec_rd_addr", "5'd 1")
            assign(f, "spec_rd_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_pc_wdata", "next_pc")

        footer(f)

def c_li(instruction="c_li", misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ci(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 010 && instruction_opcode == 2'b 01")
        assign(f, "spec_rd_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def c_addi16sp(instruction="c_addi16sp", misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ci_sp(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 011 && instruction_opcode == 2'b 01 && instruction_rs1_rd == 5'd 2 && instruction_imm")
        assign(f, "spec_rs1_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def c_lui(instruction="c_lui", misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ci_lui(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 011 && instruction_opcode == 2'b 01 && instruction_rs1_rd != 5'd 2 && instruction_imm")
        assign(f, "spec_rd_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def c_sri(instruction, funct2, expr, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ci_sri(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = %s;" % expr, file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 100 && instruction_funct2 == 2'b %s && instruction_opcode == 2'b 01 && (!instruction_shamt[5] || `RISCV_FORMAL_XLEN == 64)" % funct2)
        assign(f, "spec_rs1_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def c_andi(instruction="c_andi", misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ci_andi(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata & instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 100 && instruction_funct2 == 2'b 10 && instruction_opcode == 2'b 01")
        assign(f, "spec_rs1_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def c_alu(instruction, funct6, funct2, expr, wmode=False, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_cs_alu(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        if wmode:
            print("  wire [31:0] result = %s;" % expr, file=f)
        else:
            print("  wire [`RISCV_FORMAL_XLEN-1:0] result = %s;" % expr, file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct6 == 6'b %s && instruction_funct2 == 2'b %s && instruction_opcode == 2'b 01" % (funct6, funct2))
        assign(f, "spec_rs1_addr", "instruction_rs1_rd")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_rd_addr", "instruction_rs1_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def c_b(instruction, funct3, expr, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_cb(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire cond = %s;" % expr, file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = cond ? rvfi_pc_rdata + instruction_imm : rvfi_pc_rdata + 2;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 01" % funct3)
        assign(f, "spec_rs1_addr", "instruction_rs1")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(next_pc[0] != 0) || !misa_ok")

        footer(f)

def c_sli(instruction, expr, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ci_sli(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = %s;" % expr, file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b 000 && instruction_opcode == 2'b 10 && (!instruction_shamt[5] || `RISCV_FORMAL_XLEN == 64)")
        assign(f, "spec_rs1_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def c_lsp(instruction, funct3, numbytes, signext, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_ci_lsp(f, numbytes)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 10 && instruction_rd" % funct3)
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_rmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata;" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 10 && instruction_rd" % funct3)
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rd_addr", "instruction_rd")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_rmask", "((1 << %d)-1)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def c_ssp(instruction, funct3, numbytes, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_css(f, numbytes)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 10" % funct3)
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + instruction_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct3 == 3'b %s && instruction_opcode == 2'b 10" % funct3)
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_wmask", "((1 << %d)-1)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def c_jalr(instruction, funct4, link, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_cr(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = rvfi_rs1_rdata & ~1;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct4 == 4'b %s && instruction_rs1_rd && !instruction_rs2 && instruction_opcode == 2'b 10" % funct4)
        assign(f, "spec_rs1_addr", "instruction_rs1_rd")
        if link:
            assign(f, "spec_rd_addr", "5'd 1")
            assign(f, "spec_rd_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(next_pc[0] != 0) || !misa_ok")

        footer(f)

def c_mvadd(instruction, funct4, add, misa=MISA_C):
    with open(os.path.join(output_prefix, "%s.v" % instruction), "w") as f:
        header(f, instruction)
        format_cr(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % instruction.upper(), file=f)
        if add:
            print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + rvfi_rs2_rdata;", file=f)
        else:
            print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs2_rdata;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !instruction_padding && instruction_funct4 == 4'b %s && instruction_rs2 && instruction_opcode == 2'b 10" % funct4)
        if add:
            assign(f, "spec_rs1_addr", "instruction_rs1_rd")
        assign(f, "spec_rs2_addr", "instruction_rs2")
        assign(f, "spec_rd_addr", "instruction_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

## Base Integer ISA (I)

current_isa = ["rv32i"]

lui()
auipc()
jal()
jalr()

b("beq",  "000", "rvfi_rs1_rdata == rvfi_rs2_rdata")
b("bne",  "001", "rvfi_rs1_rdata != rvfi_rs2_rdata")
b("blt",  "100", "$signed(rvfi_rs1_rdata) < $signed(rvfi_rs2_rdata)")
b("bge",  "101", "$signed(rvfi_rs1_rdata) >= $signed(rvfi_rs2_rdata)")
b("bltu", "110", "rvfi_rs1_rdata < rvfi_rs2_rdata")
b("bgeu", "111", "rvfi_rs1_rdata >= rvfi_rs2_rdata")

l("lb",  "000", 1, True)
l("lh",  "001", 2, True)
l("lw",  "010", 4, True)
l("lbu", "100", 1, False)
l("lhu", "101", 2, False)

s("sb",  "000", 1)
s("sh",  "001", 2)
s("sw",  "010", 4)

imm("addi",  "000", "rvfi_rs1_rdata + instruction_imm")
imm("slti",  "010", "$signed(rvfi_rs1_rdata) < $signed(instruction_imm)")
imm("sltiu", "011", "rvfi_rs1_rdata < instruction_imm")
imm("xori",  "100", "rvfi_rs1_rdata ^ instruction_imm")
imm("ori",   "110", "rvfi_rs1_rdata | instruction_imm")
imm("andi",  "111", "rvfi_rs1_rdata & instruction_imm")

shimm("slli", "000000", "001", "rvfi_rs1_rdata << instruction_shamt")
shimm("srli", "000000", "101", "rvfi_rs1_rdata >> instruction_shamt")
shimm("srai", "010000", "101", "$signed(rvfi_rs1_rdata) >>> instruction_shamt")

alu("add",  "0000000", "000", "rvfi_rs1_rdata + rvfi_rs2_rdata")
alu("sub",  "0100000", "000", "rvfi_rs1_rdata - rvfi_rs2_rdata")
alu("sll",  "0000000", "001", "rvfi_rs1_rdata << shamt", shamt=True)
alu("slt",  "0000000", "010", "$signed(rvfi_rs1_rdata) < $signed(rvfi_rs2_rdata)")
alu("sltu", "0000000", "011", "rvfi_rs1_rdata < rvfi_rs2_rdata")
alu("xor",  "0000000", "100", "rvfi_rs1_rdata ^ rvfi_rs2_rdata")
alu("srl",  "0000000", "101", "rvfi_rs1_rdata >> shamt", shamt=True)
alu("sra",  "0100000", "101", "$signed(rvfi_rs1_rdata) >>> shamt", shamt=True)
alu("or",   "0000000", "110", "rvfi_rs1_rdata | rvfi_rs2_rdata")
alu("and",  "0000000", "111", "rvfi_rs1_rdata & rvfi_rs2_rdata")

current_isa = ["rv64i"]

l("lwu", "110", 4, False)
l("ld",  "011", 8, True)
s("sd",  "011", 8)

imm("addiw",  "000", "rvfi_rs1_rdata[31:0] + instruction_imm[31:0]", wmode=True)

shimm("slliw", "000000", "001", "rvfi_rs1_rdata[31:0] << instruction_shamt", wmode=True)
shimm("srliw", "000000", "101", "rvfi_rs1_rdata[31:0] >> instruction_shamt", wmode=True)
shimm("sraiw", "010000", "101", "$signed(rvfi_rs1_rdata[31:0]) >>> instruction_shamt", wmode=True)

alu("addw", "0000000", "000", "rvfi_rs1_rdata[31:0] + rvfi_rs2_rdata[31:0]", wmode=True)
alu("subw", "0100000", "000", "rvfi_rs1_rdata[31:0] - rvfi_rs2_rdata[31:0]", wmode=True)
alu("sllw", "0000000", "001", "rvfi_rs1_rdata[31:0] << shamt", shamt=True, wmode=True)
alu("srlw", "0000000", "101", "rvfi_rs1_rdata[31:0] >> shamt", shamt=True, wmode=True)
alu("sraw", "0100000", "101", "$signed(rvfi_rs1_rdata[31:0]) >>> shamt", shamt=True, wmode=True)

## Multiply/Divide ISA (M)

current_isa = ["rv32im"]

alu("mul",    "0000001", "000", "rvfi_rs1_rdata * rvfi_rs2_rdata", alt_add=0x2cdf52a55876063e, misa=MISA_M)
alu("mulh",   "0000001", "001", "({{`RISCV_FORMAL_XLEN{rvfi_rs1_rdata[`RISCV_FORMAL_XLEN-1]}}, rvfi_rs1_rdata} *\n" +
        "\t\t{{`RISCV_FORMAL_XLEN{rvfi_rs2_rdata[`RISCV_FORMAL_XLEN-1]}}, rvfi_rs2_rdata}) >> `RISCV_FORMAL_XLEN", alt_add=0x15d01651f6583fb7, misa=MISA_M)
alu("mulhsu", "0000001", "010", "({{`RISCV_FORMAL_XLEN{rvfi_rs1_rdata[`RISCV_FORMAL_XLEN-1]}}, rvfi_rs1_rdata} *\n" +
        "\t\t{`RISCV_FORMAL_XLEN'b0, rvfi_rs2_rdata}) >> `RISCV_FORMAL_XLEN", alt_sub=0xea3969edecfbe137, misa=MISA_M)
alu("mulhu",  "0000001", "011", "({`RISCV_FORMAL_XLEN'b0, rvfi_rs1_rdata} * {`RISCV_FORMAL_XLEN'b0, rvfi_rs2_rdata}) >> `RISCV_FORMAL_XLEN", alt_add=0xd13db50d949ce5e8, misa=MISA_M)

alu("div",    "0000001", "100", """rvfi_rs2_rdata == `RISCV_FORMAL_XLEN'b0 ? {`RISCV_FORMAL_XLEN{1'b1}} :
                                         rvfi_rs1_rdata == {1'b1, {`RISCV_FORMAL_XLEN-1{1'b0}}} && rvfi_rs2_rdata == {`RISCV_FORMAL_XLEN{1'b1}} ? {1'b1, {`RISCV_FORMAL_XLEN-1{1'b0}}} :
                                         $signed(rvfi_rs1_rdata) / $signed(rvfi_rs2_rdata)""", alt_sub=0x29bbf66f7f8529ec, misa=MISA_M)

alu("divu",   "0000001", "101", """rvfi_rs2_rdata == `RISCV_FORMAL_XLEN'b0 ? {`RISCV_FORMAL_XLEN{1'b1}} :
                                         rvfi_rs1_rdata / rvfi_rs2_rdata""", alt_sub=0x8c629acb10e8fd70, misa=MISA_M)

alu("rem",    "0000001", "110", """rvfi_rs2_rdata == `RISCV_FORMAL_XLEN'b0 ? rvfi_rs1_rdata :
                                         rvfi_rs1_rdata == {1'b1, {`RISCV_FORMAL_XLEN-1{1'b0}}} && rvfi_rs2_rdata == {`RISCV_FORMAL_XLEN{1'b1}} ? {`RISCV_FORMAL_XLEN{1'b0}} :
                                         $signed(rvfi_rs1_rdata) % $signed(rvfi_rs2_rdata)""", alt_sub=0xf5b7d8538da68fa5, misa=MISA_M)

alu("remu",   "0000001", "111", """rvfi_rs2_rdata == `RISCV_FORMAL_XLEN'b0 ? rvfi_rs1_rdata :
                                         rvfi_rs1_rdata % rvfi_rs2_rdata""", alt_sub=0xbc4402413138d0e1, misa=MISA_M)

current_isa = ["rv64im"]

alu("mulw",    "0000001", "000", "rvfi_rs1_rdata[31:0] * rvfi_rs2_rdata[31:0]", alt_add=0x2cdf52a55876063e, wmode=True, misa=MISA_M)

alu("divw",    "0000001", "100", """rvfi_rs2_rdata[31:0] == 32'b0 ? {32{1'b1}} :
                       rvfi_rs1_rdata == {1'b1, {31{1'b0}}} && rvfi_rs2_rdata == {32{1'b1}} ? {1'b1, {31{1'b0}}} :
                       $signed(rvfi_rs1_rdata[31:0]) / $signed(rvfi_rs2_rdata[31:0])""", alt_sub=0x29bbf66f7f8529ec, wmode=True, misa=MISA_M)

alu("divuw",   "0000001", "101", """rvfi_rs2_rdata[31:0] == 32'b0 ? {32{1'b1}} :
                       rvfi_rs1_rdata[31:0] / rvfi_rs2_rdata[31:0]""", alt_sub=0x8c629acb10e8fd70, wmode=True, misa=MISA_M)

alu("remw",    "0000001", "110", """rvfi_rs2_rdata == 32'b0 ? rvfi_rs1_rdata :
                       rvfi_rs1_rdata == {1'b1, {31{1'b0}}} && rvfi_rs2_rdata == {32{1'b1}} ? {32{1'b0}} :
                       $signed(rvfi_rs1_rdata[31:0]) % $signed(rvfi_rs2_rdata[31:0])""", alt_sub=0xf5b7d8538da68fa5, wmode=True, misa=MISA_M)

alu("remuw",   "0000001", "111", """rvfi_rs2_rdata == 32'b0 ? rvfi_rs1_rdata :
                       rvfi_rs1_rdata[31:0] % rvfi_rs2_rdata[31:0]""", alt_sub=0xbc4402413138d0e1, wmode=True, misa=MISA_M)

## Atomics ISA (A)

# current_isa = ["rv32ia"]

# FIXME: LR.W / SC.W
# instruction_amo("amoswap_w", "00001", "010", "rvfi_rs2_rdata[31:0]")
# instruction_amo("amoadd_w",  "00000", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : rvfi_mem_rdata + rvfi_rs2_rdata[31:0]")
# instruction_amo("amoxor_w",  "00100", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : rvfi_mem_rdata ^ rvfi_rs2_rdata[31:0]")
# instruction_amo("amoand_w",  "01100", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : rvfi_mem_rdata & rvfi_rs2_rdata[31:0]")
# instruction_amo("amoor_w",   "01000", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : rvfi_mem_rdata | rvfi_rs2_rdata[31:0]")
# instruction_amo("amomin_w",  "10000", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : ($signed(rvfi_mem_rdata) < $signed(rvfi_rs2_rdata[31:0]) ? rvfi_mem_rdata : rvfi_rs2_rdata[31:0])")
# instruction_amo("amomax_w",  "10100", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : ($signed(rvfi_mem_rdata) > $signed(rvfi_rs2_rdata[31:0]) ? rvfi_mem_rdata : rvfi_rs2_rdata[31:0])")
# instruction_amo("amominu_w", "11000", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : (rvfi_mem_rdata < rvfi_rs2_rdata[31:0] ? rvfi_mem_rdata : rvfi_rs2_rdata[31:0])")
# instruction_amo("amomaxu_w", "11100", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : (rvfi_mem_rdata > rvfi_rs2_rdata[31:0] ? rvfi_mem_rdata : rvfi_rs2_rdata[31:0])")

# current_isa = ["rv64ia"]

# FIXME: LR.D / SC.D
# instruction_amo("amoswap_d", "00001", "011", "rvfi_rs2_rdata[63:0]")
# instruction_amo("amoadd_d",  "00000", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : rvfi_mem_rdata + rvfi_rs2_rdata[63:0]")
# instruction_amo("amoxor_d",  "00100", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : rvfi_mem_rdata ^ rvfi_rs2_rdata[63:0]")
# instruction_amo("amoand_d",  "01100", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : rvfi_mem_rdata & rvfi_rs2_rdata[63:0]")
# instruction_amo("amoor_d",   "01000", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : rvfi_mem_rdata | rvfi_rs2_rdata[63:0]")
# instruction_amo("amomin_d",  "10000", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : ($signed(rvfi_mem_rdata) < $signed(rvfi_rs2_rdata[63:0]) ? rvfi_mem_rdata : rvfi_rs2_rdata[63:0])")
# instruction_amo("amomax_d",  "10100", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : ($signed(rvfi_mem_rdata) > $signed(rvfi_rs2_rdata[63:0]) ? rvfi_mem_rdata : rvfi_rs2_rdata[63:0])")
# instruction_amo("amominu_d", "11000", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : (rvfi_mem_rdata < rvfi_rs2_rdata[63:0] ? rvfi_mem_rdata : rvfi_rs2_rdata[63:0])")
# instruction_amo("amomaxu_d", "11100", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : (rvfi_mem_rdata > rvfi_rs2_rdata[63:0] ? rvfi_mem_rdata : rvfi_rs2_rdata[63:0])")

## Compressed Integer ISA (IC)

current_isa = ["rv32ic"]

c_addi4spn()
c_l("c_lw", "010", 4, True)
c_s("c_sw", "110", 4)
c_addi()
c_jal("c_jal", "001", True)
c_li()
c_addi16sp()
c_lui()
c_sri("c_srli", "00", "rvfi_rs1_rdata >> instruction_shamt")
c_sri("c_srai", "01", "$signed(rvfi_rs1_rdata) >>> instruction_shamt")
c_andi()
c_alu("c_sub", "100011", "00", "rvfi_rs1_rdata - rvfi_rs2_rdata")
c_alu("c_xor", "100011", "01", "rvfi_rs1_rdata ^ rvfi_rs2_rdata")
c_alu("c_or",  "100011", "10", "rvfi_rs1_rdata | rvfi_rs2_rdata")
c_alu("c_and", "100011", "11", "rvfi_rs1_rdata & rvfi_rs2_rdata")
c_jal("c_j", "101", False)
c_b("c_beqz", "110", "rvfi_rs1_rdata == 0")
c_b("c_bnez", "111", "rvfi_rs1_rdata != 0")
c_sli("c_slli", "rvfi_rs1_rdata << instruction_shamt")
c_lsp("c_lwsp", "010", 4, True)
c_jalr("c_jr", "1000", False)
c_mvadd("c_mv", "1000", False)
c_jalr("c_jalr", "1001", True)
c_mvadd("c_add", "1001", True)
c_ssp("c_swsp", "110", 4)

current_isa = ["rv64ic"]

c_addi("c_addiw", wmode=True)
c_alu("c_subw", "100111", "00", "rvfi_rs1_rdata[31:0] - rvfi_rs2_rdata[31:0]", wmode=True)
c_alu("c_addw", "100111", "01", "rvfi_rs1_rdata[31:0] + rvfi_rs2_rdata[31:0]", wmode=True)

c_l("c_ld", "011", 8, True)
c_s("c_sd", "111", 8)
c_lsp("c_ldsp", "011", 8, True)
c_ssp("c_sdsp", "111", 8)

## ISA Propagate

def isa_propagate_pair(from_isa, to_isa):
     global isa_database
     assert from_isa in isa_database
     if to_isa not in isa_database:
         isa_database[to_isa] = set()
     isa_database[to_isa] |= isa_database[from_isa]

def isa_propagate(suffix):
    for i in range(2 ** len(suffix)):
        src = ""
        for k in range(len(suffix)):
            if ((i >> k) & 1) == 0:
                src += suffix[k]
        if src != suffix:
            isa_propagate_pair("rv32i" + src, "rv32i" + suffix)
            isa_propagate_pair("rv64i" + src, "rv64i" + suffix)
    isa_propagate_pair("rv32i" + suffix, "rv64i" + suffix)

isa_propagate("")
isa_propagate("c")
isa_propagate("m")
isa_propagate("mc")

## ISA Fixup

for isa, instructions in isa_database.items():
    if isa.startswith("rv64"):
        instructions.discard("c_jal")

## ISA Listings and ISA Models

for isa, instructions in isa_database.items():
    with open(os.path.join(output_prefix, "isa_%s.txt" % isa), "w") as f:
        for instruction in sorted(instructions):
            print(instruction, file=f)

    with open(os.path.join(output_prefix, "isa_%s.v" % isa), "w") as f:
        header(f, isa, isa_mode=True)

        for instruction in sorted(instructions):
            print("  wire                                spec_instruction_%s_valid;"     % instruction, file=f)
            print("  wire                                spec_instruction_%s_trap;"      % instruction, file=f)
            print("  wire [                       4 : 0] spec_instruction_%s_rs1_addr;"  % instruction, file=f)
            print("  wire [                       4 : 0] spec_instruction_%s_rs2_addr;"  % instruction, file=f)
            print("  wire [                       4 : 0] spec_instruction_%s_rd_addr;"   % instruction, file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_%s_rd_wdata;"  % instruction, file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_%s_pc_wdata;"  % instruction, file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_%s_mem_addr;"  % instruction, file=f)
            print("  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_%s_mem_rmask;" % instruction, file=f)
            print("  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_instruction_%s_mem_wmask;" % instruction, file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_%s_mem_wdata;"  % instruction, file=f)
            print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_instruction_%s_csr_misa_rmask;" % instruction, file=f)
            print("`endif", file=f)
            print("", file=f)
            print("  rvfi_instruction_%s %s (" % (instruction, instruction), file=f)
            print("    .rvfi_valid(rvfi_valid),", file=f)
            print("    .rvfi_instruction(rvfi_instruction),", file=f)
            print("    .rvfi_pc_rdata(rvfi_pc_rdata),", file=f)
            print("    .rvfi_rs1_rdata(rvfi_rs1_rdata),", file=f)
            print("    .rvfi_rs2_rdata(rvfi_rs2_rdata),", file=f)
            print("    .rvfi_mem_rdata(rvfi_mem_rdata),", file=f)
            print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
            print("    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),", file=f)
            print("    .spec_csr_misa_rmask(spec_instruction_%s_csr_misa_rmask)," % instruction, file=f)
            print("`endif", file=f)
            print("    .spec_valid(spec_instruction_%s_valid)," % instruction, file=f)
            print("    .spec_trap(spec_instruction_%s_trap)," % instruction, file=f)
            print("    .spec_rs1_addr(spec_instruction_%s_rs1_addr)," % instruction, file=f)
            print("    .spec_rs2_addr(spec_instruction_%s_rs2_addr)," % instruction, file=f)
            print("    .spec_rd_addr(spec_instruction_%s_rd_addr)," % instruction, file=f)
            print("    .spec_rd_wdata(spec_instruction_%s_rd_wdata)," % instruction, file=f)
            print("    .spec_pc_wdata(spec_instruction_%s_pc_wdata)," % instruction, file=f)
            print("    .spec_mem_addr(spec_instruction_%s_mem_addr)," % instruction, file=f)
            print("    .spec_mem_rmask(spec_instruction_%s_mem_rmask)," % instruction, file=f)
            print("    .spec_mem_wmask(spec_instruction_%s_mem_wmask)," % instruction, file=f)
            print("    .spec_mem_wdata(spec_instruction_%s_mem_wdata)" % instruction, file=f)
            print("  );", file=f)
            print("", file=f)

        for port in ["valid", "trap", "rs1_addr", "rs2_addr", "rd_addr", "rd_wdata", "pc_wdata", "mem_addr", "mem_rmask", "mem_wmask", "mem_wdata"]:
            print("  assign spec_%s =\n\t\t%s : 0;" % (port, " :\n\t\t".join(["spec_instruction_%s_valid ? spec_instruction_%s_%s" % (instruction, instruction, port) for instruction in sorted(instructions)])), file=f)

        print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
        print("  assign spec_csr_misa_rmask =\n\t\t%s : 0;" % (" :\n\t\t".join(["spec_instruction_%s_valid ? spec_instruction_%s_csr_misa_rmask" % (instruction, instruction) for instruction in sorted(instructions)])), file=f)
        print("`endif", file=f)

        print("endmodule", file=f)
