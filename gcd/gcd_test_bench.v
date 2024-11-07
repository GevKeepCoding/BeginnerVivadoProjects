module gcd_test_bench;
    reg clk;
    reg rst;
    reg start;
    reg [31:0] x, y;
    //reg [31:0] gcd;
    wire [31:0] gcd_out;
    wire done;
    
    
    gcd_top uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .x(x),
        .y(y),
        .gcd(gcd_out),
        .done(done)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        start = 0;
        x = 32'd15;
        y = 32'd10;
        #10 rst = 0;
        #10 start = 1;
        #10 start = 0;
        #100;
        $stop;
    end
endmodule