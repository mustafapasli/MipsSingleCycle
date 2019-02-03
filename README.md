# MipsSingleCycle

This project is mips single cycle processor implementation using structural Verilog on Altera Quartus II. 

- Top module name is mips32_single_cycle.
- Support R-type instructions and andi, ori, addiu, lw, sw, beq and j instructions.
- Only the next PC calculating block, register block and memory blocks behavioral but others structural verilog.
- Instruction memory is written down the resultant contents of the data memory and the register in testbench Verilog.

![adsiz](https://user-images.githubusercontent.com/17300652/39626351-30d170b8-4faa-11e8-8d62-64c07bdd231d.png)
