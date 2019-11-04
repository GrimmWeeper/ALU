set projDir "D:/Alchitry/ALU/work/planAhead"
set projName "ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Alchitry/ALU/work/verilog/mojo_top_0.v" "D:/Alchitry/ALU/work/verilog/reset_conditioner_1.v" "D:/Alchitry/ALU/work/verilog/multi_seven_seg_2.v" "D:/Alchitry/ALU/work/verilog/aluCompiled_3.v" "D:/Alchitry/ALU/work/verilog/counter_4.v" "D:/Alchitry/ALU/work/verilog/seven_seg_5.v" "D:/Alchitry/ALU/work/verilog/decoder_6.v" "D:/Alchitry/ALU/work/verilog/adder16b_7.v" "D:/Alchitry/ALU/work/verilog/compare16b_8.v" "D:/Alchitry/ALU/work/verilog/boolean16b_9.v" "D:/Alchitry/ALU/work/verilog/shifter16b_10.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/io_shield.ucf" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/mojo.ucf" ]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
