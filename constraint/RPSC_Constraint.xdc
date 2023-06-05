############## NET - IOSTANDARD ##################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
############## clock  and reset define##################
create_clock -period 20.000 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN P15 [get_ports sys_clk]
#set_property IOSTANDARD LVCMOS15 [get_ports {rst_n}]
#set_property PACKAGE_PIN AB2 [get_ports {rst_n}]
#############RPSC##########################
set_property PACKAGE_PIN E22 [get_ports {o_TP1}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_TP1}]

set_property PACKAGE_PIN D22 [get_ports {o_TP2}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_TP2}]

set_property PACKAGE_PIN B21 [get_ports {o_TP3}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_TP3}]

set_property PACKAGE_PIN B22 [get_ports {o_TP4}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_TP4}]

set_property PACKAGE_PIN D21 [get_ports {o_TP5}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_TP5}]

set_property PACKAGE_PIN C22 [get_ports {o_HV_ON_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_HV_ON_BAR}]

set_property PACKAGE_PIN D20 [get_ports {o_HV_OFF_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_HV_OFF_BAR}]

set_property PACKAGE_PIN C20 [get_ports {o_ANY_HV_GO_OFF_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_ANY_HV_GO_OFF_BAR}]

set_property PACKAGE_PIN C19 [get_ports {o_RED_RF_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_RED_RF_BAR}]

set_property PACKAGE_PIN B19 [get_ports {o_FULL_RF_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_FULL_RF_BAR}]

set_property PACKAGE_PIN D18 [get_ports {o_HV_Ready_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_HV_Ready_BAR}]

set_property PACKAGE_PIN C18 [get_ports {o_ANY_SB_GO_OFF_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_ANY_SB_GO_OFF_BAR}]

set_property PACKAGE_PIN D16 [get_ports {o_SB_OFF_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_SB_OFF_BAR}]

set_property PACKAGE_PIN C17 [get_ports {o_SB_ON_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_SB_ON_BAR}]

set_property PACKAGE_PIN C15 [get_ports {i_OT_AN_Ready}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_OT_AN_Ready}]

set_property PACKAGE_PIN C16 [get_ports {o_TH_AN_Ready}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_TH_AN_Ready}]

set_property PACKAGE_PIN A20 [get_ports {i_Card_POS}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_Card_POS}]

set_property PACKAGE_PIN B20 [get_ports {i_FAN_ACT}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_FAN_ACT}]

set_property PACKAGE_PIN A19 [get_ports {i_FAN_ON_PERM}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_FAN_ON_PERM}]

set_property PACKAGE_PIN A18 [get_ports {i_FAN_OFF_Delay}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_FAN_OFF_Delay}]

set_property PACKAGE_PIN A17 [get_ports {i_Air_Grid}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_Air_Grid}]

set_property PACKAGE_PIN A16 [get_ports {i_Air_AN}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_Air_AN}]

set_property PACKAGE_PIN B16 [get_ports {i_Water_Heat_EXCH}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_Water_Heat_EXCH}]

set_property PACKAGE_PIN B15 [get_ports {i_Water_AN}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_Water_AN}]

set_property PACKAGE_PIN A13 [get_ports {i_Door_PAMP}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_Door_PAMP}]

set_property PACKAGE_PIN B13 [get_ports {i_GR_SW}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_GR_SW}]

set_property PACKAGE_PIN A12 [get_ports {i_HV_Connector}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_HV_Connector}]

set_property PACKAGE_PIN A11 [get_ports {i_CA_PS_ACT}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_CA_PS_ACT}]

set_property PACKAGE_PIN C11 [get_ports {o_FAN_ON}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_FAN_ON}]

set_property PACKAGE_PIN C10 [get_ports {o_CA_ON}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_CA_ON}]

set_property PACKAGE_PIN F21 [get_ports {o_LA_Emergency}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Emergency}]

set_property PACKAGE_PIN F22 [get_ports {o_LA_Card_POS}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Card_POS}]

set_property PACKAGE_PIN G21 [get_ports {o_LA_Air_Grid}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Air_Grid}]

set_property PACKAGE_PIN G22 [get_ports {o_LA_Air_Anode}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Air_Anode}]

set_property PACKAGE_PIN F19 [get_ports {o_LA_Water_Heat_EXCH}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Water_Heat_EXCH}]

set_property PACKAGE_PIN F20 [get_ports {o_LA_Water_Anode}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Water_Anode}]

set_property PACKAGE_PIN E19 [get_ports {o_LA_Door_PAMP}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Door_PAMP}]

set_property PACKAGE_PIN D19 [get_ports {o_LA_GR_SW_PAMP}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_GR_SW_PAMP}]

set_property PACKAGE_PIN E17 [get_ports {o_LA_HV_Connector}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_HV_Connector}]

set_property PACKAGE_PIN E18 [get_ports {o_LA_G1_PS_TEST}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_G1_PS_TEST}]

set_property PACKAGE_PIN E15 [get_ports {o_LA_AN_PS_Local}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_AN_PS_Local}]

set_property PACKAGE_PIN E16 [get_ports {o_LA_Dummy_AN_PS}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Dummy_AN_PS}]

set_property PACKAGE_PIN G14 [get_ports {o_LA_G2_PS_TEST}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_G2_PS_TEST}]

set_property PACKAGE_PIN F15 [get_ports {o_LA_I_G2_HIGH}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_I_G2_HIGH}]

set_property PACKAGE_PIN F13 [get_ports {o_LA_FAN_OFF_Delay}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_FAN_OFF_Delay}]

set_property PACKAGE_PIN F14 [get_ports {o_LA_G1_PS_Fault}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_G1_PS_Fault}]

set_property PACKAGE_PIN G13 [get_ports {o_LA_G2_PS_Fault}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_G2_PS_Fault}]

set_property PACKAGE_PIN A14 [get_ports {o_C2_RLY_DRAC}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_C2_RLY_DRAC}]

set_property PACKAGE_PIN B14 [get_ports {o_C2_RLY_G2}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_C2_RLY_G2}]

set_property PACKAGE_PIN C13 [get_ports {o_C2_RLY_AN}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_C2_RLY_AN}]

set_property PACKAGE_PIN D13 [get_ports {o_C2_RLY_G1}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_C2_RLY_G1}]

set_property PACKAGE_PIN D14 [get_ports {o_C2_RLY_CA}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_C2_RLY_CA}]

set_property PACKAGE_PIN D15 [get_ports {i_C2_RLY_EM}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_C2_RLY_EM}]

set_property PACKAGE_PIN D12 [get_ports {i_C2_RLY_RESET}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_C2_RLY_RESET}]

set_property PACKAGE_PIN C12 [get_ports {i_LA_TEST}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_LA_TEST}]

set_property PACKAGE_PIN E12 [get_ports {i_U_G1_LOW}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_U_G1_LOW}]

set_property PACKAGE_PIN F12 [get_ports {i_U_G2_LOW}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_U_G2_LOW}]

set_property PACKAGE_PIN D11 [get_ports {i_U_AN_LOW}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_U_AN_LOW}]

set_property PACKAGE_PIN E11 [get_ports {i_U_CA_LOW}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_U_CA_LOW}]

set_property PACKAGE_PIN F11 [get_ports {i_I_AN_HIGH_5A}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_I_AN_HIGH_5A}]

set_property PACKAGE_PIN G11 [get_ports {i_I_AN_HIGH_6A}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_I_AN_HIGH_6A}]

set_property PACKAGE_PIN F10 [get_ports {i_DC_PS_LOW}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_DC_PS_LOW}]

set_property PACKAGE_PIN G10 [get_ports {i_I_CA_HIGH}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_I_CA_HIGH}]

set_property PACKAGE_PIN P22 [get_ports {o_LA_U_G2_LOW}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_U_G2_LOW}]

set_property PACKAGE_PIN P21 [get_ports {o_LA_I_AN_HIGH}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_I_AN_HIGH}]

set_property PACKAGE_PIN T22 [get_ports {o_LA_U_AN_LOW}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_U_AN_LOW}]

set_property PACKAGE_PIN T21 [get_ports {o_LA_U_G1_LOW}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_U_G1_LOW}]

set_property PACKAGE_PIN U22 [get_ports {o_LA_I_CA_HIGH}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_I_CA_HIGH}]

set_property PACKAGE_PIN V22 [get_ports {o_LA_U_CA_LOW}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_U_CA_LOW}]

set_property PACKAGE_PIN W22 [get_ports {o_LA_CA_Delay}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_CA_Delay}]

set_property PACKAGE_PIN V21 [get_ports {o_LA_Reduced_RF_PERM}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Reduced_RF_PERM}]

set_property PACKAGE_PIN V19 [get_ports {o_LA_RF_Reduced}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_RF_Reduced}]

set_property PACKAGE_PIN V18 [get_ports {o_LA_DR_AMP_ON}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_DR_AMP_ON}]

set_property PACKAGE_PIN U19 [get_ports {o_LA_DR_AMP_ON_PERM}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_DR_AMP_ON_PERM}]

set_property PACKAGE_PIN U18 [get_ports {o_LA_Grid2_ON}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Grid2_ON}]

set_property PACKAGE_PIN U17 [get_ports {o_LA_Grid2_ON_PERM}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Grid2_ON_PERM}]

set_property PACKAGE_PIN T17 [get_ports {o_LA_Anode_ON}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Anode_ON}]

set_property PACKAGE_PIN R17 [get_ports {o_LA_Anode_ON_PERM}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Anode_ON_PERM}]

set_property PACKAGE_PIN R16 [get_ports {o_LA_Grid_ON}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Grid_ON}]

set_property PACKAGE_PIN N15 [get_ports {o_LA_Grid_ON_PERM}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Grid_ON_PERM}]

set_property PACKAGE_PIN R18 [get_ports {o_LA_Cathode_ON}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Cathode_ON}]

set_property PACKAGE_PIN P17 [get_ports {o_LA_Cathode_ON_PERM}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Cathode_ON_PERM}]

set_property PACKAGE_PIN Y21 [get_ports {o_LA_FAN_ON}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_FAN_ON}]

set_property PACKAGE_PIN W21 [get_ports {o_LA_FAN_ON_PERM}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_FAN_ON_PERM}]

set_property PACKAGE_PIN V20 [get_ports {o_LA_G2_PS_Internal_Fault}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_G2_PS_Internal_Fault}]

set_property PACKAGE_PIN U20 [get_ports {o_LA_G1_PS_OT}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_G1_PS_OT}]

set_property PACKAGE_PIN T20 [get_ports {o_LA_I_G1_HIGH}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_I_G1_HIGH}]

set_property PACKAGE_PIN T19 [get_ports {o_LA_AN_PS_OC}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_AN_PS_OC}]

set_property PACKAGE_PIN R20 [get_ports {o_LA_AN_PS_Fault}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_AN_PS_Fault}]

set_property PACKAGE_PIN R19 [get_ports {o_LA_TEMP_DR_AMP}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_TEMP_DR_AMP}]

set_property PACKAGE_PIN N20 [get_ports {o_UART_TX}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_UART_TX}]

set_property PACKAGE_PIN P20 [get_ports {i_UART_RX}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_UART_RX}]

set_property PACKAGE_PIN AA22 [get_ports {o_LA_Alarm}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Alarm}]

set_property PACKAGE_PIN Y22 [get_ports {o_LA_Control_Voltages}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_LA_Control_Voltages}]

set_property PACKAGE_PIN AB21 [get_ports {i_Temp_DR_AMP}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_Temp_DR_AMP}]

set_property PACKAGE_PIN AA21 [get_ports {i_DR_AMP}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_DR_AMP}]

set_property PACKAGE_PIN AB19 [get_ports {i_TUNE_OK_Delayed_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_TUNE_OK_Delayed_BAR}]

set_property PACKAGE_PIN AB20 [get_ports {o_RF_PERM_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_RF_PERM_BAR}]

set_property PACKAGE_PIN Y20 [get_ports {o_RF_RED_BAR}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_RF_RED_BAR}]

set_property PACKAGE_PIN AA20 [get_ports {i_G2_PS_Internal_Fault}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_G2_PS_Internal_Fault}]

set_property PACKAGE_PIN W18 [get_ports {i_I_G2_HIGH}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_I_G2_HIGH}]

set_property PACKAGE_PIN Y19 [get_ports {i_G2_PS_Fault}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_G2_PS_Fault}]

set_property PACKAGE_PIN M18 [get_ports {i_G2_PS_Local}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_G2_PS_Local}]

set_property PACKAGE_PIN M17 [get_ports {i_G2_PS_ACT}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_G2_PS_ACT}]

set_property PACKAGE_PIN K19 [get_ports {i_AN_PS_Dummy}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_AN_PS_Dummy}]

set_property PACKAGE_PIN K18 [get_ports {i_I_AN_PS_High}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_I_AN_PS_High}]

set_property PACKAGE_PIN J16 [get_ports {i_AN_PS_Fault}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_AN_PS_Fault}]

set_property PACKAGE_PIN K16 [get_ports {i_AN_PS_Local}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_AN_PS_Local}]

set_property PACKAGE_PIN L15 [get_ports {i_AN_PS_ACT}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_AN_PS_ACT}]

set_property PACKAGE_PIN M15 [get_ports {i_I_G1_High}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_I_G1_High}]

set_property PACKAGE_PIN J15 [get_ports {i_G1_PS_OT}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_G1_PS_OT}]

set_property PACKAGE_PIN K15 [get_ports {i_G1_PS_Fault}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_G1_PS_Fault}]

set_property PACKAGE_PIN G16 [get_ports {i_G1_PS_Local}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_G1_PS_Local}]

set_property PACKAGE_PIN H16 [get_ports {i_G1_PS_ACT}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_G1_PS_ACT}]


