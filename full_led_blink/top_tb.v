module top_tb;  
  
// Inputs  
reg clk125_p_i;  
reg clk125_n_i;  
reg reset;  
reg btn_in;  
  
// Outputs  
wire led_out;  
  
// Instantiate the Unit Under Test (UUT)  
top uut (  
    .clk125_p_i(clk125_p_i),   
    .clk125_n_i(clk125_n_i),   
    .reset(reset),   
    .btn_in(btn_in),   
    .led_out(led_out)  
);  
  
// Clock generation  
initial begin  
    clk125_p_i = 0;  
    clk125_n_i = 1;  
    forever begin  
        #4 clk125_p_i = ~clk125_p_i;  
        #4 clk125_n_i = ~clk125_n_i;  
    end  
end  
  
// Test sequence  
initial begin

//    btn_in = 0;
//    reset = 0;

//    #100;

//    btn_in = 1;



  
    // Initialize Inputs  
//    reset = 1;  
//    btn_in = 0;  
  
    // Wait for global reset to finish  
//    #100;  
      
    // Release reset
    reset = 1;
    # 100  
    reset = 0;
    btn_in = 1;  
    #100;  
    // Test case 1: btn_in = 0, led_out should be 0  
//    #1000;  
//    if (led_out !== 1'b0) $display("Test case 1 failed");  
  
//    // Test case 2: btn_in = 1, led_out should follow counter_r[28]  
//    btn_in = 1;  
//    #100000;  
//    if (led_out !== uut.counter_r[28]) $display("Test case 2 failed");  
  
//    // Test case 3: Apply reset and check if counter_r is reset  
//    reset = 1;  
//    #100;  
//    reset = 0;  
//    #100;  
//    if (uut.counter_r !== 32'd0) $display("Test case 3 failed");  
  
//    // Test case 4: Check counter increment  
//    #1000;  
//    if (uut.counter_r !== 32'd100) $display("Test case 4 failed");  
  
//    // Finish simulation  
//    $stop;  
end  
  
endmodule  