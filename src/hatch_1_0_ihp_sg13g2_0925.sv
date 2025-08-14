// Copyright 2024 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Authors:
// - Philippe Sauter <phsauter@iis.ee.ethz.ch>

module hatch_1_0_ihp_sg13g2_0925 import croc_pkg::*; #() (
  input  wire clk_i,
  input  wire rst_ni,
  input  wire ref_clk_i,

  input  wire jtag_tck_i,
  input  wire jtag_trst_ni,
  input  wire jtag_tms_i,
  input  wire jtag_tdi_i,
  output wire jtag_tdo_o,

  input  wire uart_rx_i,
  output wire uart_tx_o,

  input  wire fetch_en_i,
  output wire status_o,

  inout  wire gpio0_io,
  inout  wire gpio1_io,
  inout  wire gpio2_io,
  inout  wire gpio3_io,
  inout  wire gpio4_io,
  inout  wire gpio5_io,
  inout  wire gpio6_io,
  inout  wire gpio7_io,
  inout  wire gpio8_io,
  inout  wire gpio9_io,
  inout  wire gpio10_io,
  inout  wire gpio11_io,
  inout  wire gpio12_io,
  inout  wire gpio13_io,
  inout  wire gpio14_io,
  inout  wire gpio15_io,
  inout  wire gpio16_io,
  inout  wire gpio17_io,
  inout  wire gpio18_io,
  inout  wire gpio19_io,
  inout  wire gpio20_io,
  inout  wire gpio21_io,
  inout  wire gpio22_io,
  inout  wire gpio23_io,
  inout  wire gpio24_io,
  inout  wire gpio25_io,
  inout  wire gpio26_io,
  inout  wire gpio27_io,
  inout  wire gpio28_io,
  inout  wire gpio29_io,
  inout  wire gpio30_io,
  inout  wire gpio31_io,
  output wire unused0_o,
  output wire unused1_o,
  output wire unused2_o,
  output wire unused3_o
); 
    logic soc_clk_i;
    logic soc_rst_ni;
    logic soc_ref_clk_i;
    logic soc_testmode;

    logic soc_jtag_tck_i;
    logic soc_jtag_trst_ni;
    logic soc_jtag_tms_i;
    logic soc_jtag_tdi_i;
    logic soc_jtag_tdo_o;

    logic soc_fetch_en_i;
    logic soc_status_o;

    localparam int unsigned GpioCount = 32;

    logic [GpioCount-1:0] soc_gpio_i;             
    logic [GpioCount-1:0] soc_gpio_o;            
    logic [GpioCount-1:0] soc_gpio_out_en_o; // Output enable signal; 0 -> input, 1 -> output

    sg13g2_IOPadIn        sg13g2_IOPad_clk_i        (.pad(clk_i),        .p2c(soc_clk_i));
    sg13g2_IOPadIn        sg13g2_IOPad_rst_ni       (.pad(rst_ni),       .p2c(soc_rst_ni));
    sg13g2_IOPadIn        sg13g2_IOPad_ref_clk_i    (.pad(ref_clk_i),    .p2c(soc_ref_clk_i));
    assign soc_testmode_i = '0;

    sg13g2_IOPadIn        sg13g2_IOPad_jtag_tck_i   (.pad(jtag_tck_i),   .p2c(soc_jtag_tck_i));
    sg13g2_IOPadIn        sg13g2_IOPad_jtag_trst_ni (.pad(jtag_trst_ni), .p2c(soc_jtag_trst_ni));
    sg13g2_IOPadIn        sg13g2_IOPad_jtag_tms_i   (.pad(jtag_tms_i),   .p2c(soc_jtag_tms_i));
    sg13g2_IOPadIn        sg13g2_IOPad_jtag_tdi_i   (.pad(jtag_tdi_i),   .p2c(soc_jtag_tdi_i));
    sg13g2_IOPadOut16mA   sg13g2_IOPad_jtag_tdo_o   (.pad(jtag_tdo_o),   .c2p(soc_jtag_tdo_o));

    sg13g2_IOPadIn        sg13g2_IOPad_uart_rx_i    (.pad(uart_rx_i),    .p2c(soc_uart_rx_i));
    sg13g2_IOPadOut16mA   sg13g2_IOPad_uart_tx_o    (.pad(uart_tx_o),    .c2p(soc_uart_tx_o));

    sg13g2_IOPadIn        sg13g2_IOPad_fetch_en_i   (.pad(fetch_en_i),   .p2c(soc_fetch_en_i));
    sg13g2_IOPadOut16mA   sg13g2_IOPad_status_o     (.pad(status_o),     .c2p(soc_status_o));

    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_0     (.pad(gpio0_io),     .c2p(soc_gpio_o[0]),  .p2c(soc_gpio_i[0]),   .c2p_en(soc_gpio_out_en_o[0]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_1    (.pad(gpio1_io),     .c2p(soc_gpio_o[1]),  .p2c(soc_gpio_i[1]),   .c2p_en(soc_gpio_out_en_o[1]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_2    (.pad(gpio2_io),     .c2p(soc_gpio_o[2]),  .p2c(soc_gpio_i[2]),   .c2p_en(soc_gpio_out_en_o[2]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_3    (.pad(gpio3_io),     .c2p(soc_gpio_o[3]),  .p2c(soc_gpio_i[3]),   .c2p_en(soc_gpio_out_en_o[3]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_4    (.pad(gpio4_io),     .c2p(soc_gpio_o[4]),  .p2c(soc_gpio_i[4]),   .c2p_en(soc_gpio_out_en_o[4]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_5    (.pad(gpio5_io),     .c2p(soc_gpio_o[5]),  .p2c(soc_gpio_i[5]),   .c2p_en(soc_gpio_out_en_o[5]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_6    (.pad(gpio6_io),     .c2p(soc_gpio_o[6]),  .p2c(soc_gpio_i[6]),   .c2p_en(soc_gpio_out_en_o[6]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_7    (.pad(gpio7_io),     .c2p(soc_gpio_o[7]),  .p2c(soc_gpio_i[7]),   .c2p_en(soc_gpio_out_en_o[7]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_8    (.pad(gpio8_io),     .c2p(soc_gpio_o[8]),  .p2c(soc_gpio_i[8]),   .c2p_en(soc_gpio_out_en_o[8]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_9    (.pad(gpio9_io),     .c2p(soc_gpio_o[9]),  .p2c(soc_gpio_i[9]),   .c2p_en(soc_gpio_out_en_o[9]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_10   (.pad(gpio10_io),    .c2p(soc_gpio_o[10]), .p2c(soc_gpio_i[10]),  .c2p_en(soc_gpio_out_en_o[10]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_11   (.pad(gpio11_io),    .c2p(soc_gpio_o[11]), .p2c(soc_gpio_i[11]),  .c2p_en(soc_gpio_out_en_o[11]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_12   (.pad(gpio12_io),    .c2p(soc_gpio_o[12]), .p2c(soc_gpio_i[12]),  .c2p_en(soc_gpio_out_en_o[12]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_13   (.pad(gpio13_io),    .c2p(soc_gpio_o[13]), .p2c(soc_gpio_i[13]),  .c2p_en(soc_gpio_out_en_o[13]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_14   (.pad(gpio14_io),    .c2p(soc_gpio_o[14]), .p2c(soc_gpio_i[14]),  .c2p_en(soc_gpio_out_en_o[14]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_15   (.pad(gpio15_io),    .c2p(soc_gpio_o[15]), .p2c(soc_gpio_i[15]),  .c2p_en(soc_gpio_out_en_o[15]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_16   (.pad(gpio16_io),    .c2p(soc_gpio_o[16]), .p2c(soc_gpio_i[16]),  .c2p_en(soc_gpio_out_en_o[16]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_17   (.pad(gpio17_io),    .c2p(soc_gpio_o[17]), .p2c(soc_gpio_i[17]),  .c2p_en(soc_gpio_out_en_o[17]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_18   (.pad(gpio18_io),    .c2p(soc_gpio_o[18]), .p2c(soc_gpio_i[18]),  .c2p_en(soc_gpio_out_en_o[18]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_19   (.pad(gpio19_io),    .c2p(soc_gpio_o[19]), .p2c(soc_gpio_i[19]),  .c2p_en(soc_gpio_out_en_o[19]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_20  (.pad(gpio20_io),    .c2p(soc_gpio_o[20]), .p2c(soc_gpio_i[20]),  .c2p_en(soc_gpio_out_en_o[20]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_21   (.pad(gpio21_io),    .c2p(soc_gpio_o[21]), .p2c(soc_gpio_i[21]),  .c2p_en(soc_gpio_out_en_o[21]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_22   (.pad(gpio22_io),    .c2p(soc_gpio_o[22]), .p2c(soc_gpio_i[22]),  .c2p_en(soc_gpio_out_en_o[22]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_23   (.pad(gpio23_io),    .c2p(soc_gpio_o[23]), .p2c(soc_gpio_i[23]),  .c2p_en(soc_gpio_out_en_o[23]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_24   (.pad(gpio24_io),    .c2p(soc_gpio_o[24]), .p2c(soc_gpio_i[24]),  .c2p_en(soc_gpio_out_en_o[24]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_25   (.pad(gpio25_io),    .c2p(soc_gpio_o[25]), .p2c(soc_gpio_i[25]),  .c2p_en(soc_gpio_out_en_o[25]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_26   (.pad(gpio26_io),    .c2p(soc_gpio_o[26]), .p2c(soc_gpio_i[26]),  .c2p_en(soc_gpio_out_en_o[26]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_27  (.pad(gpio27_io),    .c2p(soc_gpio_o[27]), .p2c(soc_gpio_i[27]),  .c2p_en(soc_gpio_out_en_o[27]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_28   (.pad(gpio28_io),    .c2p(soc_gpio_o[28]), .p2c(soc_gpio_i[28]),  .c2p_en(soc_gpio_out_en_o[28]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_29   (.pad(gpio29_io),    .c2p(soc_gpio_o[29]), .p2c(soc_gpio_i[29]),  .c2p_en(soc_gpio_out_en_o[29]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_30   (.pad(gpio30_io),    .c2p(soc_gpio_o[30]), .p2c(soc_gpio_i[30]),  .c2p_en(soc_gpio_out_en_o[30]));
    sg13g2_IOPadInOut30mA sg13g2_IOPad_io_31   (.pad(gpio31_io),    .c2p(soc_gpio_o[31]), .p2c(soc_gpio_i[31]),  .c2p_en(soc_gpio_out_en_o[31]));
    sg13g2_IOPadOut16mA sg13g2_IOPad_unused_0     (.pad(unused0_o),    .c2p(soc_status_o));
    sg13g2_IOPadOut16mA sg13g2_IOPad_unused_1      (.pad(unused1_o),    .c2p(soc_status_o));
    sg13g2_IOPadOut16mA sg13g2_IOPad_unused_2      (.pad(unused2_o),    .c2p(soc_status_o));
    sg13g2_IOPadOut16mA sg13g2_IOPad_unused_3      (.pad(unused3_o),    .c2p(soc_status_o));

    (* dont_touch = "true" *)sg13g2_IOPadVdd sg13g2_IOPad_vdd0();
    //(* dont_touch = "true" *)sg13g2_IOPadVdd sg13g2_IOPad_vdd1();
    //(* dont_touch = "true" *)sg13g2_IOPadVdd sg13g2_IOPad_vdd2();
    //(* dont_touch = "true" *)sg13g2_IOPadVdd sg13g2_IOPad_vdd3();

    (* dont_touch = "true" *)sg13g2_IOPadVss sg13g2_IOPad_vss0();
    //(* dont_touch = "true" *)sg13g2_IOPadVss sg13g2_IOPad_vss1();
    //(* dont_touch = "true" *)sg13g2_IOPadVss sg13g2_IOPad_vss2();
    //(* dont_touch = "true" *)sg13g2_IOPadVss sg13g2_IOPad_vss3();

    (* dont_touch = "true" *)sg13g2_IOPadIOVdd sg13g2_IOPad_vddio0();
    //(* dont_touch = "true" *)sg13g2_IOPadIOVdd pad_vddio1();
    //(* dont_touch = "true" *)sg13g2_IOPadIOVdd pad_vddio2();
    //(* dont_touch = "true" *)sg13g2_IOPadIOVdd pad_vddio3();

    (* dont_touch = "true" *)sg13g2_IOPadIOVss sg13g2_IOPad_vssio0();
    //(* dont_touch = "true" *)sg13g2_IOPadIOVss pad_vssio1();
    //(* dont_touch = "true" *)sg13g2_IOPadIOVss pad_vssio2();
    //(* dont_touch = "true" *)sg13g2_IOPadIOVss pad_vssio3();

  hatch #(
    .GpioCount( GpioCount )
  )
  i_hatch (
    .clk_i          ( soc_clk_i      ),
    .rst_ni         ( soc_rst_ni     ),
    .ref_clk_i      ( soc_ref_clk_i  ),
    .testmode_i     ( soc_testmode_i ),
    .fetch_en_i     ( soc_fetch_en_i ),
    .status_o       ( soc_status_o   ),

    .jtag_tck_i     ( soc_jtag_tck_i   ),
    .jtag_tdi_i     ( soc_jtag_tdi_i   ),
    .jtag_tdo_o     ( soc_jtag_tdo_o   ),
    .jtag_tms_i     ( soc_jtag_tms_i   ),
    .jtag_trst_ni   ( soc_jtag_trst_ni ),

    .uart_rx_i      ( soc_uart_rx_i ),
    .uart_tx_o      ( soc_uart_tx_o ),

    .gpio_i         ( soc_gpio_i        ),             
    .gpio_o         ( soc_gpio_o        ),            
    .gpio_out_en_o  ( soc_gpio_out_en_o )
  );

endmodule
