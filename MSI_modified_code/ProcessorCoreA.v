module ProcessorCoreA(
	input clk, input [31:0] fetched_data,
	output read, write, output [8:0] address, output [31:0] write_data
);//cada um com suas instrucoes separadas
// Instructions Scheme:
// |op ~1bit|address ~9bits|data ~16bits| ~41bits
//  41       40          32 31         0
// where, op==1: write, op==0 read 
	integer i,index;
	reg [41:0] instructions [0:64];//64x41bits instructions memory size
	initial begin
		$readmemb("core1_instructions.txt", instructions); // memory file
		index <= -1;
		$display("core1_instructions: ");
		for(i=0; i<10; i=i+1) begin
			$display("%b",instructions[i]);
		end
	end
	
	always@(posedge clk)begin
		index <= index + 1;
	end
	assign read = instructions[index][41] == 0 ? 1'b1:1'b0;
	assign write = instructions[index][41];
	assign address = instructions[index][40:32];
	assign write_data = instructions[index][31:0];
endmodule
