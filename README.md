# RPSC_FPGA

## Tutorial
Verilog Tutorial in UW EE271 (Scott Hauck version):
https://class.ece.uw.edu/271/hauck2/documents/VerilogTutorial.pdf

ModelSim Installation: 
https://class.ece.uw.edu/271/hauck2/software/ModelSimSetup-17.0.0.595-windows.exe

## Naming Convention for Verilog
Module input/output example: i13_Not_Alarm where i for input (o for output), 13 for pin number on that card, NotAlarm is the description of the pin. If there is no description for a pin, just skip it. 

Wires that interconnect modules: source card/module, pin number of the source pin, description of the source pin (if applicable), "to", destination card/module, pin number of the destination pin, description of the destination pin (if applicable). 
Example: card6_34_to_card1_55_Not_Alarm
