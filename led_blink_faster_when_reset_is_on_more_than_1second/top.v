module top (clk125_p_i, clk125_n_i, reset, btn_in, led_out);
input clk125_p_i, clk125_n_i, reset, btn_in;
output led_out;
reg [31:0] counter_r;
wire clk125_b4buf;


IBUFDS bufds_clk125 ( .I(clk125_p_i), .IB(clk125_n_i), .O(clk125_b4buf) );
BUFG   bufg_clk125 ( .I(clk125_b4buf), .O(clk) );

wire clk_high_freq;  
clk_wiz_0 clk_wiz_inst (  
    .clk_in1(clk),  // Input clock  
    .clk_out1(clk_high_freq) // Output clock with higher frequency  
);  
// if reset is on for more than 1 second, then blink faster (look at 29th bit of the counter)
// and when it's off, blink slower as usual

assign led_out = reset ? counter_r[29] : counter_r[30];

always @(posedge clk_high_freq) begin
    if (reset) begin
        counter_r <= counter_r + 32'b1;
    end else begin
        counter_r <= counter_r + 32'b1;
    end
end

endmodule
// we have 125MHZ clocks, then we can use clock wizard to get 750MHZ clock