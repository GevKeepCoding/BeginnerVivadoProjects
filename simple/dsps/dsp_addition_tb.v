module dsp_addition_tb;  
  
    reg clk;  
    reg [17:0] a;  
    reg [17:0] b;  
    wire [18:0] result;  
  
    // Instantiate the dsp_addition module  
    top uut (  
        .clk(clk),  
        .a(a),  
        .b(b),  
        .result(result)  
    );  
  
    // Clock generation  
    initial begin  
        clk = 0;  
        forever #5 clk = ~clk;  // 10 ns clock period  
    end  
  
    // Test stimulus  
    initial begin  
        // Initialize inputs  
        a = 0;  
        b = 0;  
  
        // Wait for a few clock cycles  
        #20;  
  
        // Test case 1  
        a = 18'd100;  
        b = 18'd200;  
        #90;  // Wait few clock cycles  
        $display("Test 1: a = %d, b = %d, result = %d", a, b, result);  
  
        // Test case 2  
        a = 18'd30000;  
        b = 18'd45000;  
        #90;  
        $display("Test 2: a = %d, b = %d, result = %d", a, b, result);  
  
        // Test case 3  
        a = 18'd65535;  
        b = 18'd1;  
        #80;  
        $display("Test 3: a = %d, b = %d, result = %d", a, b, result);  
  
        // Finish simulation  
        #20;  
        $finish;  
    end  
  
endmodule  