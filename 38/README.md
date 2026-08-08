# Line Following Robot using Verilog HDL

## 1. Introduction

A Line Following Robot is an autonomous robot that follows a predefined
path using sensors.

This project implements the control logic of a two-sensor line following
robot using Verilog HDL.

The design is simulated using a Verilog simulator and the output waveform
can be viewed using GTKWave.

---

## 2. Objective

The main objective of this project is to design and simulate a digital
controller for a line following robot using Verilog HDL.

The controller receives inputs from two sensors and generates control
signals for the left and right motors.

---

## 3. Features

- Two-line sensor inputs
- Left and right motor control
- Automatic direction control
- Verilog HDL implementation
- Verilog testbench
- Simulation waveform
- Easy to understand logic

---

## 4. Inputs and Outputs

### Inputs

| Signal | Description |
|--------|-------------|
| left_sensor | Left line sensor |
| right_sensor | Right line sensor |

### Outputs

| Signal | Description |
|--------|-------------|
| left_motor_forward | Controls forward motion of left motor |
| left_motor_backward | Controls backward motion of left motor |
| right_motor_forward | Controls forward motion of right motor |
| right_motor_backward | Controls backward motion of right motor |

---

## 5. Working Principle

The robot uses two sensors to detect the line.

The controller continuously checks the sensor values and controls the
motors accordingly.

| Left Sensor | Right Sensor | Action |
|-------------|--------------|--------|
| 0 | 0 | Move Forward |
| 1 | 0 | Turn Left |
| 0 | 1 | Turn Right |
| 1 | 1 | Stop |

Here, 1 represents line detection and 0 represents no line detection.

---

## 6. Block Diagram

```text
        +----------------+
        |  Left Sensor   |
        +-------+--------+
                |
                |
        +-------v--------+
        |                |
        | Verilog        |
        | Controller     |
        |                |
        +-------+--------+
                |
        +-------+--------+
        |                |
   +----v----+      +----v----+
   |  Left   |      |  Right  |
   |  Motor  |      |  Motor  |
   +---------+      +---------+