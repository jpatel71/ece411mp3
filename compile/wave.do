onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /mp2_cpu/clk
add wave -noupdate -format Literal /mp2_cpu/thedatapath/pcout
add wave -noupdate -format Literal /mp2_cpu/address
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/alinejoiner/wcdata
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/alru/data
add wave -noupdate -divider Regs
add wave -noupdate -format Literal -expand /mp2_cpu/thedatapath/aregfile/ram
add wave -noupdate -divider States
add wave -noupdate -format Literal /mp2_cpu/controlunit/current_state
add wave -noupdate -divider Way0
add wave -noupdate -format Literal -expand /mp2_cpu/dram/cache_dp/way0/adataarray/data
add wave -noupdate -format Literal -expand /mp2_cpu/dram/cache_dp/way0/adirtyarray/dirty
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/way0/dataout
add wave -noupdate -format Logic /mp2_cpu/dram/cache_dp/prehit0
add wave -noupdate -divider Way1
add wave -noupdate -format Literal -expand /mp2_cpu/dram/cache_dp/way1/adataarray/data
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/way1/dataout
add wave -noupdate -format Literal -expand /mp2_cpu/dram/cache_dp/way1/adirtyarray/dirty
add wave -noupdate -format Logic /mp2_cpu/dram/cache_dp/prehit1
add wave -noupdate -format Literal -expand /mp2_cpu/dram/cache_dp/alru/data
add wave -noupdate -divider {Memory Stuff}
add wave -noupdate -format Literal /mp2_cpu/dram/address
add wave -noupdate -format Literal /mp2_cpu/dram/dataout
add wave -noupdate -format Literal /mp2_cpu/dram/datain
add wave -noupdate -format Logic /mp2_cpu/dram/mread_l
add wave -noupdate -format Logic /mp2_cpu/dram/mwriteh_l
add wave -noupdate -format Logic /mp2_cpu/dram/mwritel_l
add wave -noupdate -format Logic /mp2_cpu/dram/mresp_h
add wave -noupdate -divider {PM Stuff}
add wave -noupdate -format Literal /mp2_cpu/dram/cache_cont/current_state
add wave -noupdate -format Literal /mp2_cpu/dram/pmdatain
add wave -noupdate -format Literal /mp2_cpu/dram/pmaddress
add wave -noupdate -format Literal /mp2_cpu/dram/address
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/aaddrjoin/b
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/atagmux/tagout1
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/atagmux/tagmuxout
add wave -noupdate -format Logic /mp2_cpu/dram/cache_dp/atagmux/lruout
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/atagmux/tagout0
add wave -noupdate -format Literal /mp2_cpu/dram/pmdataout
add wave -noupdate -format Logic /mp2_cpu/dram/pmread_l
add wave -noupdate -format Logic /mp2_cpu/dram/pmresp_h
add wave -noupdate -format Logic /mp2_cpu/dram/pmwrite_l
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17457 ns} 0}
configure wave -namecolwidth 376
configure wave -valuecolwidth 343
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
WaveRestoreZoom {15441 ns} {20073 ns}
