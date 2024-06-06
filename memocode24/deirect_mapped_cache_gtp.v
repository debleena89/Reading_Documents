module direct_mapped_cache (
    input wire clk,          // Clock input
    input wire reset,        // Reset signal
    input wire [31:0] addr,  // Address input
    input wire [31:0] data_in,  // Data input
    input wire write_enable, // Write enable signal

    output reg [31:0] data_out  // Data output
);

parameter CACHE_SIZE = 1024;  // Cache size in bytes
parameter BLOCK_SIZE = 32;    // Block size in bytes
parameter NUM_BLOCKS = CACHE_SIZE / BLOCK_SIZE;  // Number of blocks in cache

// Cache Tag, Index, and Offset calculations
parameter TAG_BITS = $clog2(NUM_BLOCKS);  // Number of bits for tag
parameter INDEX_BITS = $clog2(NUM_BLOCKS); // Number of bits for index
parameter OFFSET_BITS = $clog2(BLOCK_SIZE); // Number of bits for offset

reg [TAG_BITS-1:0] tag;
reg [INDEX_BITS-1:0] index;
reg [OFFSET_BITS-1:0] offset;

// Cache memory array
reg [31:0] cache_memory [0:NUM_BLOCKS-1][0:BLOCK_SIZE/4-1];

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset cache to all zeros
        for (integer i = 0; i < NUM_BLOCKS; i = i + 1) begin
            for (integer j = 0; j < BLOCK_SIZE/4; j = j + 1) begin
                cache_memory[i][j] <= 0;
            end
        end
    end
    else begin
        // Calculate tag, index, and offset from address
        tag = addr[31:32-TAG_BITS];
        index = addr[31-OFFSET_BITS:32-OFFSET_BITS-INDEX_BITS];
        offset = addr[OFFSET_BITS-1:0];

        // Cache read operation
        if (!write_enable) begin
            if (cache_memory[index][offset/4] != 32'hxxxxxxxx) begin
                // Cache hit
                data_out <= cache_memory[index][offset/4];
            end
            else begin
                // Cache miss
                // Perform memory access to fetch data
                // Update cache with fetched data
                // For direct-mapped cache, data is stored directly to cache memory
                // In a real implementation, this would involve fetching the block from main memory
                // and updating the cache block.
                // For simplicity, assume data is directly stored in cache without fetching.
                // Here, we just pass the address directly to output data for simulation.
                data_out <= data_in;
                cache_memory[index][offset/4] <= data_in;
            end
        end
        // Cache write operation
        else begin
            // Write data to cache
            cache_memory[index][offset/4] <= data_in;
            // Also update data_out to reflect the written data
            data_out <= data_in;
        end
    end
end

endmodule

