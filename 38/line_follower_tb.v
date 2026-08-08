//============================================================
// Testbench : Line Following Robot
// File      : line_follower_tb.v
//============================================================

`timescale 1ns/1ps

module line_follower_tb;

    reg left_sensor;
    reg right_sensor;

    wire left_motor_forward;
    wire left_motor_backward;
    wire right_motor_forward;
    wire right_motor_backward;

    // Instantiate the Design Under Test
    line_follower DUT (
        .left_sensor(left_sensor),
        .right_sensor(right_sensor),

        .left_motor_forward(left_motor_forward),
        .left_motor_backward(left_motor_backward),
        .right_motor_forward(right_motor_forward),
        .right_motor_backward(right_motor_backward)
    );

    // Generate test cases
    initial begin

        $dumpfile("line_follower.vcd");
        $dumpvars(0, line_follower_tb);

        $display("================================================");
        $display("      LINE FOLLOWING ROBOT SIMULATION");
        $display("================================================");
        $display("Time | L-Sensor | R-Sensor | Action");
        $display("------------------------------------------------");

        // Test 1: Both sensors OFF
        left_sensor  = 1'b0;
        right_sensor = 1'b0;
        #10;

        $display("%4t |     %b    |     %b    | FORWARD",
                 $time, left_sensor, right_sensor);

        // Test 2: Left sensor ON
        left_sensor  = 1'b1;
        right_sensor = 1'b0;
        #10;

        $display("%4t |     %b    |     %b    | TURN LEFT",
                 $time, left_sensor, right_sensor);

        // Test 3: Right sensor ON
        left_sensor  = 1'b0;
        right_sensor = 1'b1;
        #10;

        $display("%4t |     %b    |     %b    | TURN RIGHT",
                 $time, left_sensor, right_sensor);

        // Test 4: Both sensors ON
        left_sensor  = 1'b1;
        right_sensor = 1'b1;
        #10;

        $display("%4t |     %b    |     %b    | STOP",
                 $time, left_sensor, right_sensor);

        $display("================================================");
        $display("           SIMULATION COMPLETED");
        $display("================================================");

        $finish;
    end

endmodule