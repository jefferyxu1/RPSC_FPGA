# RPSC_FPGA
### Naming Convention for Verilog
Module input/output example : i13NotAlarm where i for input (o for output), 13 for pin number on that card, NotAlarm is the description of the pin. If there is no description for a pin, just skip it. 
Wires that interconnect modules: source card/module, pin number of the source pin, description of the source pin (if applicable), "to", destination card/module, pin number of the destination pin, description of the destination pin (if applicable). Example: card6_34_to_card1_55_NotAlarm