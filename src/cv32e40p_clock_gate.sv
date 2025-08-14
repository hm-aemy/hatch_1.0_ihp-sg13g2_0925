module cv32e40p_clock_gate (
  input  logic clk_i,
  input  logic en_i,
  input  logic scan_cg_en_i,
  output logic clk_o
);

    (* keep *)(* dont_touch = "true" *)
    sg13g2_slgcp_1 i_clkgate (
      .GATE ( en_i  ),
      .SCE  ( scan_cg_en_i ),
      .CLK  ( clk_i ),
      .GCLK ( clk_o )
    );

endmodule