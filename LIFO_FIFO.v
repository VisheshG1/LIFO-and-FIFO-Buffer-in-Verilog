module LIFO_FIFO(
input mode, // Mode selector (0 for FIFO, 1 for LIFO)
input Clk, // Clock
input [7:0] dataIn, // Data to be written
input RD, // Read enable
input WR, // Write enable
input EN, // Buffer enable
input Rst, // Reset
output reg [7:0] dataOut, // Data read from buffer
output reg EMPTY, // Buffer empty flag
output reg FULL // Buffer full flag
);
// FIFO buffer signals and variables
reg [2:0] Count = 0;
reg [7:0] FIFO [0:7];
reg [2:0] readCounter = 0, writeCounter = 0;
// LIFO buffer signals and variables
reg [7:0] stack_mem[0:7];
reg [2:0] SP = 0;
// Combinational logic for EMPTY and FULL
always @* begin
EMPTY = (mode == 0 && Count == 0) || (mode == 1 && SP == 0);
FULL = (mode == 0 && Count == 7) || (mode == 1 && SP == 7); // Updated comment: Buffer full condition
end
// Sequential logic for buffer operations
always @(negedge Clk) begin
if (Rst) begin
if (mode == 0) begin
dataOut <= 8'b00000000; // FIFO reset
readCounter <= 0;
writeCounter <= 0;
Count <= 0;
end else begin // LIFO reset
dataOut <= 8'b00000000;
SP <= 0;
Count <=0; // Initialize Stack Pointer to the size of the stack
end
end else if (EN) begin
if (mode == 0) begin // FIFO operations
if (WR) begin // Write operation
FIFO[writeCounter] <= dataIn;
if (Count == 7) begin
Count <= 7;
end else begin
Count <= Count + 1;
writeCounter <= writeCounter + 1;
end
end else if (RD) begin // Read operation
dataOut <= FIFO[readCounter];
readCounter <= readCounter + 1;
Count <= Count - 1;
end
end else begin // LIFO operations
if (WR) begin // Write operation
stack_mem[SP] <= dataIn; // Push dataIn onto the top of the stack
if (SP == 7) begin
SP <= 7;
end else begin
SP <= SP + 1;
end
end else if (RD) begin // Read operation
dataOut <= stack_mem[SP];
SP <= SP - 1; // Increment the stack pointer after read operation
end
end
end
end
endmodule