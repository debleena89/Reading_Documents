/*  @author : Adaptive & Secure Computing Systems (ASCS) Laboratory

 *  Copyright (c) 2019 BRISC-V (ASCS/ECE/BU)
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 z
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 *
 */

module five_stage_bypass_unit #(
  parameter CORE            = 0,
  parameter SCAN_CYCLES_MIN = 0,
  parameter SCAN_CYCLES_MAX = 1000
) (
  input clock,
  input reset,

  input true_data_hazard,

  input rs1_hazard_execute,
  input rs1_hazard_memory,
  input rs1_hazard_writeback,

  input rs2_hazard_execute,
  input rs2_hazard_memory,
  input rs2_hazard_writeback,

  output [1:0] rs1_data_bypass,
  output [1:0] rs2_data_bypass,

  input scan
);


// Generate bypass mux control signal
assign rs1_data_bypass = (rs1_hazard_execute   & ~true_data_hazard) ? 2'b01 :
                         (rs1_hazard_memory    & ~true_data_hazard) ? 2'b10 :
                         (rs1_hazard_writeback & ~true_data_hazard) ? 2'b11 :
                         2'b00;

assign rs2_data_bypass = (rs2_hazard_execute   & ~true_data_hazard) ? 2'b01 :
                         (rs2_hazard_memory    & ~true_data_hazard) ? 2'b10 :
                         (rs2_hazard_writeback & ~true_data_hazard) ? 2'b11 :
                         2'b00;

reg [31: 0] cycles;
always @ (posedge clock) begin
  cycles <= reset? 0 : cycles + 1;
  if (scan  & ((cycles >= SCAN_CYCLES_MIN) & (cycles <= SCAN_CYCLES_MAX)) )begin
    $display ("------ Core %d Five Stage Bypass Unit - Current Cycle %d ------", CORE, cycles);
    $display ("| RS1 Data Bypass  [%b]", rs1_data_bypass);
    $display ("| RS2 Data Bypass  [%b]", rs2_data_bypass);
    $display ("----------------------------------------------------------------------");
  end
end



endmodule
