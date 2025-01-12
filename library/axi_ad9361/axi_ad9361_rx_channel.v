// ***************************************************************************
// ***************************************************************************
// Copyright 2011(c) Analog Devices, Inc.
// 
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//     - Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     - Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in
//       the documentation and/or other materials provided with the
//       distribution.
//     - Neither the name of Analog Devices, Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//     - The use of this software may or may not infringe the patent rights
//       of one or more patent holders.  This license does not release you
//       from the requirement that you obtain separate licenses from these
//       patent holders to use this software.
//     - Use of the software either in source or binary form, must be run
//       on or directly connected to an Analog Devices Inc. component.
//    
// THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE ARE DISCLAIMED.
//
// IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, INTELLECTUAL PROPERTY
// RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************
// ADC channel-need to work on dual mode for pn sequence

`timescale 1ns/100ps

module axi_ad9361_rx_channel (

  // adc interface

  adc_clk,
  adc_rst,
  adc_valid,
  adc_pn_oos_pl,
  adc_pn_err_pl,
  adc_data,
  adc_data_q,
  adc_or,

  // channel interface

  adc_dcfilter_data_out,
  adc_pn_oos_out,
  adc_pn_err_out,
  adc_dcfilter_data_in,
  adc_pn_oos_in,
  adc_pn_err_in,
  adc_iqcor_valid,
  adc_iqcor_data,
  adc_enable,
  adc_lb_enb,
  up_adc_pn_err,
  up_adc_pn_oos,
  up_adc_or,

  // processor interface

  up_rstn,
  up_clk,
  up_sel,
  up_wr,
  up_addr,
  up_wdata,
  up_rdata,
  up_ack);

  // parameters

  parameter IQSEL = 0;
  parameter CHID = 0;
  parameter DP_DISABLE = 0;

  // adc interface

  input           adc_clk;
  input           adc_rst;
  input           adc_valid;
  input           adc_pn_oos_pl;
  input           adc_pn_err_pl;
  input   [11:0]  adc_data;
  input   [11:0]  adc_data_q;
  input           adc_or;

  // channel interface

  output  [15:0]  adc_dcfilter_data_out;
  output          adc_pn_oos_out;
  output          adc_pn_err_out;
  input   [15:0]  adc_dcfilter_data_in;
  input           adc_pn_oos_in;
  input           adc_pn_err_in;
  output          adc_iqcor_valid;
  output  [15:0]  adc_iqcor_data;
  output          adc_enable;
  output          adc_lb_enb;
  output          up_adc_pn_err;
  output          up_adc_pn_oos;
  output          up_adc_or;

  // processor interface

  input           up_rstn;
  input           up_clk;
  input           up_sel;
  input           up_wr;
  input   [13:0]  up_addr;
  input   [31:0]  up_wdata;
  output  [31:0]  up_rdata;
  output          up_ack;

  // internal signals

  wire            adc_dfmt_valid_s;
  wire    [15:0]  adc_dfmt_data_s;
  wire            adc_dcfilter_valid_s;
  wire    [15:0]  adc_dcfilter_data_i_s;
  wire    [15:0]  adc_dcfilter_data_q_s;
  wire            adc_pn_sel_s;
  wire            adc_iqcor_enb_s;
  wire            adc_dcfilt_enb_s;
  wire            adc_dfmt_se_s;
  wire            adc_dfmt_type_s;
  wire            adc_dfmt_enable_s;
  wire    [15:0]  adc_dcfilt_offset_s;
  wire    [15:0]  adc_dcfilt_coeff_s;
  wire    [15:0]  adc_iqcor_coeff_1_s;
  wire    [15:0]  adc_iqcor_coeff_2_s;
  wire            adc_pn_err_s;
  wire            adc_pn_oos_s;

  // iq correction inputs

  assign adc_dcfilter_data_i_s = (IQSEL == 1) ? adc_dcfilter_data_in  : adc_dcfilter_data_out;
  assign adc_dcfilter_data_q_s = (IQSEL == 1) ? adc_dcfilter_data_out : adc_dcfilter_data_in;
  assign adc_pn_oos_s = (adc_pn_sel_s == 1'b1) ? adc_pn_oos_pl : ((IQSEL == 1) ? adc_pn_oos_in : adc_pn_oos_out);
  assign adc_pn_err_s = (adc_pn_sel_s == 1'b1) ? adc_pn_err_pl : ((IQSEL == 1) ? adc_pn_err_in : adc_pn_err_out);

  generate
  if (IQSEL == 1) begin
  assign adc_pn_oos_out = 1'b1;
  assign adc_pn_err_out = 1'b1;
  end else begin
  axi_ad9361_rx_pnmon i_rx_pnmon (
    .adc_clk (adc_clk),
    .adc_valid (adc_valid),
    .adc_data_i (adc_data),
    .adc_data_q (adc_data_q),
    .adc_pn_oos (adc_pn_oos_out),
    .adc_pn_err (adc_pn_err_out));
  end
  endgenerate

  generate
  if (DP_DISABLE == 1) begin
  assign adc_dfmt_valid_s = adc_valid;
  assign adc_dfmt_data_s = {4'd0, adc_data};
  end else begin
  ad_datafmt #(.DATA_WIDTH(12)) i_ad_datafmt (
    .clk (adc_clk),
    .valid (adc_valid),
    .data (adc_data),
    .valid_out (adc_dfmt_valid_s),
    .data_out (adc_dfmt_data_s),
    .dfmt_enable (adc_dfmt_enable_s),
    .dfmt_type (adc_dfmt_type_s),
    .dfmt_se (adc_dfmt_se_s));
  end
  endgenerate

  generate
  if (DP_DISABLE == 1) begin
  assign adc_dcfilter_valid_s = adc_dfmt_valid_s;
  assign adc_dcfilter_data_out = adc_dfmt_data_s;
  end else begin
  ad_dcfilter i_ad_dcfilter (
    .clk (adc_clk),
    .valid (adc_dfmt_valid_s),
    .data (adc_dfmt_data_s),
    .valid_out (adc_dcfilter_valid_s),
    .data_out (adc_dcfilter_data_out),
    .dcfilt_enb (adc_dcfilt_enb_s),
    .dcfilt_coeff (adc_dcfilt_coeff_s),
    .dcfilt_offset (adc_dcfilt_offset_s));
  end
  endgenerate

  generate
  if (DP_DISABLE == 1) begin
  assign adc_iqcor_valid = adc_dcfilter_valid_s;
  assign adc_iqcor_data = (IQSEL == 1) ? adc_dcfilter_data_q_s : adc_dcfilter_data_i_s;
  end else begin
  ad_iqcor #(.IQSEL(IQSEL)) i_ad_iqcor (
    .clk (adc_clk),
    .valid (adc_dcfilter_valid_s),
    .data_i (adc_dcfilter_data_i_s),
    .data_q (adc_dcfilter_data_q_s),
    .valid_out (adc_iqcor_valid),
    .data_out (adc_iqcor_data),
    .iqcor_enable (adc_iqcor_enb_s),
    .iqcor_coeff_1 (adc_iqcor_coeff_1_s),
    .iqcor_coeff_2 (adc_iqcor_coeff_2_s));
  end
  endgenerate

  up_adc_channel #(.PCORE_ADC_CHID(CHID)) i_up_adc_channel (
    .adc_clk (adc_clk),
    .adc_rst (adc_rst),
    .adc_enable (adc_enable),
    .adc_lb_enb (adc_lb_enb),
    .adc_pn_sel (adc_pn_sel_s),
    .adc_iqcor_enb (adc_iqcor_enb_s),
    .adc_dcfilt_enb (adc_dcfilt_enb_s),
    .adc_dfmt_se (adc_dfmt_se_s),
    .adc_dfmt_type (adc_dfmt_type_s),
    .adc_dfmt_enable (adc_dfmt_enable_s),
    .adc_pn_type (),
    .adc_dcfilt_offset (adc_dcfilt_offset_s),
    .adc_dcfilt_coeff (adc_dcfilt_coeff_s),
    .adc_iqcor_coeff_1 (adc_iqcor_coeff_1_s),
    .adc_iqcor_coeff_2 (adc_iqcor_coeff_2_s),
    .adc_pn_err (adc_pn_err_s),
    .adc_pn_oos (adc_pn_oos_s),
    .adc_or (adc_or),
    .up_adc_pn_err (up_adc_pn_err),
    .up_adc_pn_oos (up_adc_pn_oos),
    .up_adc_or (up_adc_or),
    .up_usr_datatype_be (),
    .up_usr_datatype_signed (),
    .up_usr_datatype_shift (),
    .up_usr_datatype_total_bits (),
    .up_usr_datatype_bits (),
    .up_usr_decimation_m (),
    .up_usr_decimation_n (),
    .adc_usr_datatype_be (1'b0),
    .adc_usr_datatype_signed (1'b1),
    .adc_usr_datatype_shift (8'd0),
    .adc_usr_datatype_total_bits (8'd16),
    .adc_usr_datatype_bits (8'd16),
    .adc_usr_decimation_m (16'd1),
    .adc_usr_decimation_n (16'd1),
    .up_rstn (up_rstn),
    .up_clk (up_clk),
    .up_sel (up_sel),
    .up_wr (up_wr),
    .up_addr (up_addr),
    .up_wdata (up_wdata),
    .up_rdata (up_rdata),
    .up_ack (up_ack));

endmodule

// ***************************************************************************
// ***************************************************************************

