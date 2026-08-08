//============================================================
// Project : Line Following Robot
// File    : line_follower.v
// Language: Verilog HDL
//============================================================

module line_follower (
    input  wire left_sensor,
    input  wire right_sensor,

    output reg  left_motor_forward,
    output reg  left_motor_backward,
    output reg  right_motor_forward,
    output reg  right_motor_backward
);

    always @(*) begin

        // Default: Stop
        left_motor_forward  = 1'b0;
        left_motor_backward = 1'b0;
        right_motor_forward = 1'b0;
        right_motor_backward = 1'b0;

        case ({left_sensor, right_sensor})

            // Both sensors detect the line
            2'b11: begin
                left_motor_forward  = 1'b0;
                right_motor_forward = 1'b0;
            end

            // Robot is on the correct path
            2'b00: begin
                left_motor_forward  = 1'b1;
                right_motor_forward = 1'b1;
            end

            // Line is on the left side
            2'b10: begin
                left_motor_forward  = 1'b0;
                right_motor_forward = 1'b1;
            end

            // Line is on the right side
            2'b01: begin
                left_motor_forward  = 1'b1;
                right_motor_forward = 1'b0;
            end

            default: begin
                left_motor_forward  = 1'b0;
                right_motor_forward = 1'b0;
            end

        endcase
    end

endmodule