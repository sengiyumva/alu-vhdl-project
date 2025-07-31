# alu-vhdl-project
8-Operation ALU in VHDL for Basys 3 FPGA (class project)

 SuperFancyALU – VHDL ALU Design

This project was developed as part of Digital Design Lab at Penn State Behrend.

It implements an 8-operation Arithmetic Logic Unit (ALU) on the Basys 3 FPGA board using VHDL, with shared output to a 7-segment display. Operations include add, AND, OR, XOR, compare (G/E/L), and checks for odd, even, and prime.

## 🔧 Technologies Used
- VHDL
- Xilinx Vivado 2017.2
- Basys 3 FPGA (Artix-7)
- Custom 7-segment display decoder

## 👥 Notes
This was a team-based class project. The code reflects collaborative work and is posted here to showcase my contributions and experience with VHDL and FPGA design.

## 📂 Key Files
- `SuperFancyALU_WithDisplay.vhd` – Top-level module
- `RippleCarryAdder_4bit.vhd`, `AND_Operation4bit.vhd`, `OR_Operation4bit.vhd`, etc.
- `YourDataFlowController.vhd`
- `Segment7_Decoder.vhd` & `Custom7SegmentDecoder.vhd`
- `Lab11.xdc` – Constraints file for Basys 3
