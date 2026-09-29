# MIPS Processor ASIC Physical Design

A MIPS processor implemented in Verilog and taken through a complete ASIC design flow using Synopsys tools.

## Design Flow

RTL
→ VCS Simulation
→ SDC Constraints
→ Design Compiler Synthesis
→ ICC Floorplan
→ Placement
→ Clock Tree Synthesis
→ Routing
→ DRC
→ PrimeTime STA

## Project Structure

- `rtl/` — Verilog RTL and testbench
- `constraints/` — SDC timing constraints
- `dc/` — Design Compiler scripts and reports
- `netlist/` — synthesized netlist
- `icc/` — ICC physical design reports
- `pt/` — PrimeTime setup/hold reports
- `final/` — final GDS layout

## Tools

- Synopsys VCS
- Synopsys Design Compiler
- Synopsys IC Compiler
- Synopsys PrimeTime
- SAED 90nm technology library

## Physical Design Flow

The design was synthesized from RTL and implemented through floorplanning, placement, CTS, and routing.

The final routed design achieved:

- Clock period: 10 ns
- Setup slack: positive
- Hold slack: positive
- Routing net violations: 0

## Author

Bui Quang Hieu
