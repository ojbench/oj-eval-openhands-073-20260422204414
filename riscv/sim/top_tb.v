`timescale 1ns/1ps
module top_tb;
    reg clk = 0;
    reg rst = 1;
    reg rdy = 1;

    wire [7:0] mem_dout;
    wire [31:0] mem_a;
    wire mem_wr;
    wire [31:0] dbgreg_dout;

    reg [7:0] mem_din = 8'b0;

    cpu uut(
        .clk_in(clk),
        .rst_in(rst),
        .rdy_in(rdy),
        .mem_din(mem_din),
        .mem_dout(mem_dout),
        .mem_a(mem_a),
        .mem_wr(mem_wr),
        .dbgreg_dout(dbgreg_dout)
    );

    always #5 clk = ~clk; // 100MHz

    initial begin
        $display("[TB] Starting simulation...");
        #20; rst = 0;
        #100;
        $display("[TB] dbgreg_dout=%0d", dbgreg_dout);
        $display("[TB] PASS");
        $finish;
    end
endmodule
