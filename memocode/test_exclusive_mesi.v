module FSM_MESI(
    input [1:0] state_in,
    input cpu_write_hit, cpu_read_hit,
    input cpu_write_miss, cpu_read_miss,    
    output reg [1:0] state_next,bus_next
    );
    parameter INVALID=3'b000, MODIFIED=3'b001, SHARED=3'b010, EXCLUSIVE=3'b100;
    parameter BUS_INVALIDATE=2'b00, BUS_WRITE_MISS=2'b01, BUS_READ_MISS=2'b10;
    wire cpu_write = cpu_write_hit | cpu_write_miss;//whenever a write
    wire cpu_read = cpu_read_hit | cpu_read_miss;

    initial begin
        state_next <= INVALID;
    end
    always@(*)begin
        case(state_in)
           EXCLUSIVE:begin
                case({cpu_write_hit,cpu_read_hit,cpu_write_miss,cpu_read_miss})
                    4'b0001:begin                      
                        state_next <= SHARED;                        
                    end
                    4'b0010,4'b0100 :begin
                        state_next <= EXCLUSIVE;                
                    end
                    4'b1000:begin
                        state_next <= MODIFIED;
                    end
                    default:begin
                        state_next <= INVALID;//error code
                    end
                endcase          
            end
             endcase
    end
endmodule
