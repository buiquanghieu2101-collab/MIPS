set search_path [list \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib \
    /home/ltk/MIPS/rtl \
]

set target_library [list \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib/saed90nm_min.db \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib/saed90nm_typ.db \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib/saed90nm_max.db \
]

set link_library [list \
    "*" \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib/saed90nm_min.db \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib/saed90nm_typ.db \
    /home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib/saed90nm_max.db \
]

analyze -format verilog /home/ltk/MIPS/rtl/alu_ctrl.v
analyze -format verilog /home/ltk/MIPS/rtl/mips_alu.v
analyze -format verilog /home/ltk/MIPS/rtl/mips_controller.v
analyze -format verilog /home/ltk/MIPS/rtl/mips_cpu_top.v
analyze -format verilog /home/ltk/MIPS/rtl/mips_datapath.v
analyze -format verilog /home/ltk/MIPS/rtl/reg_file.v
analyze -format verilog /home/ltk/MIPS/rtl/shifter.v

elaborate processor
current_design processor
link

read_sdc /home/ltk/MIPS/constraints/mips.sdc

check_design > /home/ltk/MIPS/dc/reports/check_design.rpt

compile

report_area > /home/ltk/MIPS/dc/reports/area.rpt
report_timing -max_paths 10 > /home/ltk/MIPS/dc/reports/timing.rpt
report_constraint -all_violators > /home/ltk/MIPS/dc/reports/constraint.rpt

write -format verilog -hierarchy \
    -output /home/ltk/MIPS/dc/output/mips_syn.v

write -format ddc -hierarchy \
    -output /home/ltk/MIPS/dc/output/mips_syn.ddc

exit
