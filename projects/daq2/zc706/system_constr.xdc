
# daq2

set_property  -dict {PACKAGE_PIN  AA8 } [get_ports rx_ref_clk_p]                                      ; ## B20  FMC_HPC_GBTCLK1_M2C_P
set_property  -dict {PACKAGE_PIN  AA7 } [get_ports rx_ref_clk_n]                                      ; ## B21  FMC_HPC_GBTCLK1_M2C_N
set_property  -dict {PACKAGE_PIN  AH10} [get_ports rx_data_p[0]]                                      ; ## C06  FMC_HPC_DP0_M2C_P
set_property  -dict {PACKAGE_PIN  AH9 } [get_ports rx_data_n[0]]                                      ; ## C07  FMC_HPC_DP0_M2C_N
set_property  -dict {PACKAGE_PIN  AJ8 } [get_ports rx_data_p[1]]                                      ; ## A02  FMC_HPC_DP1_M2C_P
set_property  -dict {PACKAGE_PIN  AJ7 } [get_ports rx_data_n[1]]                                      ; ## A03  FMC_HPC_DP1_M2C_N
set_property  -dict {PACKAGE_PIN  AG8 } [get_ports rx_data_p[2]]                                      ; ## A06  FMC_HPC_DP2_M2C_P
set_property  -dict {PACKAGE_PIN  AG7 } [get_ports rx_data_n[2]]                                      ; ## A07  FMC_HPC_DP2_M2C_N
set_property  -dict {PACKAGE_PIN  AE8 } [get_ports rx_data_p[3]]                                      ; ## A10  FMC_HPC_DP3_M2C_P
set_property  -dict {PACKAGE_PIN  AE7 } [get_ports rx_data_n[3]]                                      ; ## A11  FMC_HPC_DP3_M2C_N
set_property  -dict {PACKAGE_PIN  AG21  IOSTANDARD LVDS_25} [get_ports rx_sync_p]                     ; ## D08  FMC_HPC_LA01_CC_P
set_property  -dict {PACKAGE_PIN  AH21  IOSTANDARD LVDS_25} [get_ports rx_sync_n]                     ; ## D09  FMC_HPC_LA01_CC_N
set_property  -dict {PACKAGE_PIN  AH19  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_sysref_p]    ; ## G09  FMC_HPC_LA03_P
set_property  -dict {PACKAGE_PIN  AJ19  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_sysref_n]    ; ## G10  FMC_HPC_LA03_N

set_property  -dict {PACKAGE_PIN  AD10} [get_ports tx_ref_clk_p]                                      ; ## D04  FMC_HPC_GBTCLK0_M2C_P
set_property  -dict {PACKAGE_PIN  AD9 } [get_ports tx_ref_clk_n]                                      ; ## D05  FMC_HPC_GBTCLK0_M2C_N
set_property  -dict {PACKAGE_PIN  AK10} [get_ports tx_data_p[0]]                                      ; ## C02  FMC_HPC_DP0_C2M_P
set_property  -dict {PACKAGE_PIN  AK9 } [get_ports tx_data_n[0]]                                      ; ## C03  FMC_HPC_DP0_C2M_N
set_property  -dict {PACKAGE_PIN  AK6 } [get_ports tx_data_p[1]]                                      ; ## A22  FMC_HPC_DP1_C2M_P
set_property  -dict {PACKAGE_PIN  AK5 } [get_ports tx_data_n[1]]                                      ; ## A23  FMC_HPC_DP1_C2M_N
set_property  -dict {PACKAGE_PIN  AJ4 } [get_ports tx_data_p[2]]                                      ; ## A26  FMC_HPC_DP2_C2M_P
set_property  -dict {PACKAGE_PIN  AJ3 } [get_ports tx_data_n[2]]                                      ; ## A27  FMC_HPC_DP2_C2M_N
set_property  -dict {PACKAGE_PIN  AK2 } [get_ports tx_data_p[3]]                                      ; ## A30  FMC_HPC_DP3_C2M_P
set_property  -dict {PACKAGE_PIN  AK1 } [get_ports tx_data_n[3]]                                      ; ## A31  FMC_HPC_DP3_C2M_N
set_property  -dict {PACKAGE_PIN  AK17  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports tx_sync_p]      ; ## H07  FMC_HPC_LA02_P
set_property  -dict {PACKAGE_PIN  AK18  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports tx_sync_n]      ; ## H08  FMC_HPC_LA02_N
set_property  -dict {PACKAGE_PIN  AJ20  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports tx_sysref_p]    ; ## H10  FMC_HPC_LA04_P
set_property  -dict {PACKAGE_PIN  AK20  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports tx_sysref_n]    ; ## H11  FMC_HPC_LA04_N

set_property  -dict {PACKAGE_PIN  AH23  IOSTANDARD LVCMOS25} [get_ports spi_csn_clk]                  ; ## D11  FMC_HPC_LA05_P
set_property  -dict {PACKAGE_PIN  AG24  IOSTANDARD LVCMOS25} [get_ports spi_csn_dac]                  ; ## C14  FMC_HPC_LA10_P
set_property  -dict {PACKAGE_PIN  AE21  IOSTANDARD LVCMOS25} [get_ports spi_csn_adc]                  ; ## D15  FMC_HPC_LA09_N
set_property  -dict {PACKAGE_PIN  AH24  IOSTANDARD LVCMOS25} [get_ports spi_clk]                      ; ## D12  FMC_HPC_LA05_N
set_property  -dict {PACKAGE_PIN  AD21  IOSTANDARD LVCMOS25} [get_ports spi_sdio]                     ; ## D14  FMC_HPC_LA09_P

set_property  -dict {PACKAGE_PIN  AH22  IOSTANDARD LVCMOS25} [get_ports clkd_reset]                   ; ## C11  FMC_HPC_LA06_N
set_property  -dict {PACKAGE_PIN  AF19  IOSTANDARD LVCMOS25} [get_ports clkd_sync]                    ; ## G12  FMC_HPC_LA08_P
set_property  -dict {PACKAGE_PIN  AG19  IOSTANDARD LVCMOS25} [get_ports clkd_pd]                      ; ## G13  FMC_HPC_LA08_N
set_property  -dict {PACKAGE_PIN  AG25  IOSTANDARD LVCMOS25} [get_ports dac_reset]                    ; ## C15  FMC_HPC_LA10_N
set_property  -dict {PACKAGE_PIN  AF24  IOSTANDARD LVCMOS25} [get_ports dac_txen]                     ; ## G16  FMC_HPC_LA12_N
set_property  -dict {PACKAGE_PIN  AG22  IOSTANDARD LVCMOS25} [get_ports adc_pd]                       ; ## C10  FMC_HPC_LA06_P

set_property  -dict {PACKAGE_PIN  AF20  IOSTANDARD LVCMOS25} [get_ports clkd_status[0]]               ; ## G06  FMC_HPC_LA00_CC_P
set_property  -dict {PACKAGE_PIN  AG20  IOSTANDARD LVCMOS25} [get_ports clkd_status[1]]               ; ## G07  FMC_HPC_LA00_CC_N
set_property  -dict {PACKAGE_PIN  AF23  IOSTANDARD LVCMOS25} [get_ports dac_irq]                      ; ## G15  FMC_HPC_LA12_P
set_property  -dict {PACKAGE_PIN  AD23  IOSTANDARD LVCMOS25} [get_ports adc_fda]                      ; ## H16  FMC_HPC_LA11_P
set_property  -dict {PACKAGE_PIN  AE23  IOSTANDARD LVCMOS25} [get_ports adc_fdb]                      ; ## H17  FMC_HPC_LA11_N

# clocks

create_clock -name tx_ref_clk   -period  2.00 [get_ports tx_ref_clk_p]
create_clock -name rx_ref_clk   -period  2.00 [get_ports rx_ref_clk_p]
create_clock -name tx_div_clk   -period  4.00 [get_nets i_system_wrapper/system_i/axi_daq2_gt_tx_clk]
create_clock -name rx_div_clk   -period  4.00 [get_nets i_system_wrapper/system_i/axi_daq2_gt_rx_clk]
create_clock -name fmc_dma_clk  -period  5.00 [get_pins i_system_wrapper/system_i/sys_ps7/FCLK_CLK2]

set_clock_groups -asynchronous -group {tx_div_clk}
set_clock_groups -asynchronous -group {rx_div_clk}
set_clock_groups -asynchronous -group {fmc_dma_clk}

set_false_path -through [get_pins i_system_wrapper/system_i/axi_daq2_gt/inst/i_up_gt/i_drp_rst_reg/i_rst_reg/PRE]
set_false_path -through [get_pins i_system_wrapper/system_i/axi_daq2_gt/inst/i_up_gt/i_gt_pll_rst_reg/i_rst_reg/PRE]
set_false_path -through [get_pins i_system_wrapper/system_i/axi_daq2_gt/inst/i_up_gt/i_gt_rx_rst_reg/i_rst_reg/PRE]
set_false_path -through [get_pins i_system_wrapper/system_i/axi_daq2_gt/inst/i_up_gt/i_gt_tx_rst_reg/i_rst_reg/PRE]
set_false_path -through [get_pins i_system_wrapper/system_i/axi_daq2_gt/inst/i_up_gt/i_rx_rst_reg/i_rst_reg/PRE]
set_false_path -through [get_pins i_system_wrapper/system_i/axi_daq2_gt/inst/i_up_gt/i_tx_rst_reg/i_rst_reg/PRE]
