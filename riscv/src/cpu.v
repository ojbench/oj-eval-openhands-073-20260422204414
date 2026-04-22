// Minimal stub of RISC-V CPU with expected ACM template ports
module cpu(
    input               clk_in,
    input               rst_in,
    input               rdy_in,

    input  [7:0]        mem_din,
    output [7:0]        mem_dout,
    output [31:0]       mem_a,
    output              mem_wr,

    output [31:0]       dbgreg_dout
);
    // Simple heartbeat on dbgreg_dout to prove clocking works
    reg [31:0] dbg;
    assign dbgreg_dout = dbg;

    // Minimal memory interface (idle)
    assign mem_wr   = 1'b0;
    assign mem_dout = 8'b0;
    assign mem_a    = 32'b0;

    always @(posedge clk_in) begin
        if (rst_in) dbg <= 32'b0;
        else if (rdy_in) dbg <= dbg + 1;
    end
endmodule
