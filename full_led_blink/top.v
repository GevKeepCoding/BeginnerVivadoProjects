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


assign led_out = btn_in ? counter_r[30] : 1'b0;

always @(posedge clk_high_freq) begin
    if (reset) begin
        counter_r <= 32'b0;
    end else begin
        counter_r <= counter_r + 32'b1;
    end
end

endmodule
# we have 125MHZ clocks, then we can use clock wizard to get 750MHZ clock