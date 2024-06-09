`timescale 1ns / 100 ps
`include "lut.v"

module lut_tb();
  // Signals
  reg A;
  reg B;
  reg C;
  wire F;

  // Module Instantiation
  lut dut(
    .A(A),
    .B(B),
    .C(C),
    .F(F)
  );

  // Variables for file descriptor, iteration and time
  integer fd;
  integer i;
  time t;

  initial begin
    // Open the file
    fd = $fopen("lut_tb_output.txt","w");

    // Simulation output and hierarchy selection
    $dumpfile("lut_tb.vcd");
    $dumpvars(0,lut_tb);

    // Time format
    $timeformat(-9, 2, " ns", 10);

    // Run for all possible combinations
    for (i = 0; i < 8; i = i + 1) begin
        {A,B,C} = i; #20; t = $time;
        $fdisplay(fd,"Time = %t, {A,B,C} = %b, X = %b", t, {A,B,C}, F);
    end

    // Close file
    $fclose(fd);

    // Finish simulation
    $display("Test completed");
    $finish;

  end

endmodule
