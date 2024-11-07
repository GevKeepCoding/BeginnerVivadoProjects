module gcd_top(
    input clk,
    input rst,
    input wire [31:0] x,
    input wire [31:0] y,
    input wire start,
    output reg [31:0] gcd,
    output reg  done
);

    reg [31:0] a;
    reg [31:0] b;
    reg busy;
    
    always @(posedge clk) begin
        if (rst) begin
            a <= 32'b0;
            b <= 32'b0;
            gcd <= 32'b0;
            done <= 1'b0;
            busy <= 1'b0;
        end else if (!busy && start) begin
            a <= x;
            b <= y;
            busy <= 1'b1;
            done <= 1'b0;
        end else if (busy) begin
            if (b != 0) begin
                if (a > b)
                    a <= a - b;
                else
                    b <= b - a;
            end else begin
                gcd <= a;
                done <= 1'b1;
                busy <= 1'b0;
            end
        end
    end

endmodule