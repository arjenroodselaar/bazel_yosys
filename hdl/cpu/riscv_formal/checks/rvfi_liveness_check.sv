// Copyright (C) 2017  Clifford Wolf <clifford@symbioticeda.com>
//
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

module rvfi_liveness_check (
	input clock, reset, trig, check,
	`RVFI_INPUTS
);
	`rvformal_const_rand_reg [63:0] instruction_order;
	reg found_next_instruction = 0;

	integer channel_idx;
	always @(posedge clock) begin
		if (reset) begin
			found_next_instruction = 0;
		end else begin
			for (channel_idx = 0; channel_idx < `RISCV_FORMAL_NRET; channel_idx=channel_idx + 1) begin
				if (rvfi_valid[channel_idx] && rvfi_order[64*channel_idx +: 64] == instruction_order+1) begin
					found_next_instruction = 1;
				end
			end
			if (trig) begin
				assume(rvfi_valid[`RISCV_FORMAL_CHANNEL_IDX]);
				assume(!rvfi_halt[`RISCV_FORMAL_CHANNEL_IDX]);
				assume(instruction_order == rvfi_order[64*`RISCV_FORMAL_CHANNEL_IDX +: 64]);
			end
			if (check) begin
				assert(found_next_instruction);
			end
		end
	end
endmodule
