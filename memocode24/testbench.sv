`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 12:32:18
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench1;
    reg clk = 1;
	reg reset = 0;
	wire trap;

	always #5 clk = ~clk;

	initial begin
		//if ($test$plusargs("vcd")) begin
		///	$dumpfile("testbench.vcd");
		//	$dumpvars(0, testbench);
		//end
		repeat (2) @(posedge clk);
		reset <= 1;
		repeat (25) @(posedge clk);
		$finish;
		
	end	
		
	
	//wire mem_instr;
	wire [8:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [31:0] data_out;
	wire write_enable;
	



	
	direct_mapped_cache #(
	) uut (
		.clk         (clk        ),
		.resetn      (resetn     ),
		.mem_addr    (mem_addr   ),
		.mem_wdata  (mem_wdata  ),
		.write_enable   (write_enable  ),
		.data_out(out_data)
	    
	);	
		


endmodule
