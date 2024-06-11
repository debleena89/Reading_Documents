`timescale 1ns/1ps
module up_down_counter(clk, rst, UpDown, count);
    input clk, rst;
    input UpDown;
    output [7:0] count;
    reg [7:0] count;

    initial begin
	    count = 8'd0;
	   //pdown = 1'b0;
     end

    
    always @(posedge clk)
    begin	     
        if (rst)
            count <= 10;
        else if (UpDown &  count < 41  )
            count <= count + 8'd 0000001;
        else if(UpDown == 0 & count > 9)
            count <= count - 8'd 00000001;
            
    end
endmodule    
