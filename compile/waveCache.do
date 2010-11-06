onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {CPU STUFF}
add wave -noupdate -format Logic /mp3_cpu/reset_l
add wave -noupdate -format Logic /mp3_cpu/clk
add wave -noupdate -format Literal /mp3_cpu/d_addressout
add wave -noupdate -format Literal /mp3_cpu/d_datain
add wave -noupdate -format Literal /mp3_cpu/d_dataout
add wave -noupdate -format Logic /mp3_cpu/d_mread_l
add wave -noupdate -format Logic /mp3_cpu/d_mresp_h
add wave -noupdate -format Logic /mp3_cpu/d_mwriteh_l
add wave -noupdate -format Logic /mp3_cpu/d_mwritel_l
add wave -noupdate -format Logic /mp3_cpu/i_mread_l
add wave -noupdate -format Logic /mp3_cpu/i_mresp_h
add wave -noupdate -format Literal /mp3_cpu/idataaddress
add wave -noupdate -format Literal /mp3_cpu/idatain
add wave -noupdate -divider RAM
add wave -noupdate -format Literal /mp3_cpu/thepipeline/theregfile/ram
add wave -noupdate -divider {I Cache}
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/i_l1cache/d_mapped_controller/current_state
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_l1cache/d_mapped_controller/pmresp_h
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_l1cache/d_mapped_controller/dirty
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_l1cache/d_mapped_controller/miss
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_l1cache/d_mapped_controller/pmread_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_l1cache/d_mapped_controller/pmwrite_l
add wave -noupdate -divider {D Cache}
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/d_l1cache/d_mapped_controller/current_state
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_l1cache/d_mapped_controller/pmresp_h
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_l1cache/d_mapped_controller/dirty
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_l1cache/d_mapped_controller/miss
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_l1cache/d_mapped_controller/pmread_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_l1cache/d_mapped_controller/pmwrite_l
add wave -noupdate -divider {Mem Stuff}
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/i_dataaddress
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_mread_l
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/i_datain
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_mresp_h
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/i_pmaddress
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/i_pmdataout
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_pmread_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_pmresp_h
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/i_pmwrite_l
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/i_wdata
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/d_address
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/d_dataout
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_mread_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_mwriteh_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_mwritel_l
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/d_datain
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_mresp_h
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/d_pmaddress
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_pmread_l
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/d_pmdataout
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_pmresp_h
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/d_pmwrite_l
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/d_wdata
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/pm_address
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/pm_datain
add wave -noupdate -format Literal /mp3_cpu/thecacheblockworker/pm_dataout
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/pm_mread_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/pm_mresp_h
add wave -noupdate -format Logic /mp3_cpu/thecacheblockworker/pm_mwrite_l
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {52 ns} 0}
configure wave -namecolwidth 548
configure wave -valuecolwidth 54
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {172 ns}
