module test;

reg clk, reset;
wire [3:0] q;

// Instantiate out design
ripple_carry_counter ripple_carry_counter_inst (q, clk, reset);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(1, test);

    clk = 1'b0;
    reset = 1'b1;
    #10 reset = 1'b0;

    #200;
    reset = 1'b1;
    #10 reset = 1'b0;

    #50;
    $finish;
end

always #5 clk = ~clk;

endmodule