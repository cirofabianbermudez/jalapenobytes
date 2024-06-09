module lut(
  input A,
  input B,
  input C,
  output F
);

  assign F = (~A & C) | (B & C);

endmodule
