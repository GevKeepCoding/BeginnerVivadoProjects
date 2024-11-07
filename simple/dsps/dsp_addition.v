module top (  
    input wire clk,  
    input wire [17:0] a,  
    input wire [17:0] b,  
    output reg [18:0] result  
);  
    // A + D = P
    wire [18:0] dsp_result;  
  
    // dsp_macro_0 instance for addition  
    dsp_macro_0 dsp_inst (  
        .CLK(clk),           // Clock  
        .A(a),               // Input A  
        .D(b),               // Input D  
        .P(dsp_result)       // Output  
    );  
  
    always @(posedge clk) begin  
        result <= dsp_result;  
    end  
  
endmodule  
