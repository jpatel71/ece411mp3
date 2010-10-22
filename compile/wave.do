onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /mp3_cpu/thepipeline/clk
add wave -noupdate -format Literal /mp3_cpu/thepipeline/idataaddress
add wave -noupdate -format Literal /mp3_cpu/thepipeline/pcmuxout
add wave -noupdate -format Logic /mp3_cpu/thepipeline/branchload_mem
add wave -noupdate -format Literal /mp3_cpu/thepipeline/idatain
add wave -noupdate -format Literal /mp3_cpu/thepipeline/theif_reg/opcode_id
add wave -noupdate -format Literal /mp3_cpu/thepipeline/theid_reg/opcode_ex
add wave -noupdate -format Literal /mp3_cpu/thepipeline/theex_reg/opcode_mem
add wave -noupdate -format Literal /mp3_cpu/thepipeline/themem_reg/opcode_wb
add wave -noupdate -format Literal /mp3_cpu/thepipeline/controlword_id
add wave -noupdate -format Literal /mp3_cpu/thepipeline/controlword_ex
add wave -noupdate -format Literal /mp3_cpu/thepipeline/controlword_mem
add wave -noupdate -format Literal /mp3_cpu/thepipeline/controlword_wb
add wave -noupdate -format Literal /mp3_cpu/thepipeline/inscc_mem
add wave -noupdate -format Literal -expand /mp3_cpu/thepipeline/theregfile/ram
add wave -noupdate -divider ID
add wave -noupdate -format Literal /mp3_cpu/thepipeline/adj6_id
add wave -noupdate -format Literal /mp3_cpu/thepipeline/srcb
add wave -noupdate -format Literal /mp3_cpu/thepipeline/ir8_6_id
add wave -noupdate -format Literal /mp3_cpu/thepipeline/index6_id
add wave -noupdate -divider EX
add wave -noupdate -format Literal /mp3_cpu/thepipeline/alushfmuxout
add wave -noupdate -format Literal /mp3_cpu/thepipeline/addressmuxout
add wave -noupdate -format Literal /mp3_cpu/thepipeline/br_add_ex
add wave -noupdate -format Logic /mp3_cpu/thepipeline/addressmuxsel
add wave -noupdate -format Literal /mp3_cpu/thepipeline/addressmux1out
add wave -noupdate -divider MEM
add wave -noupdate -format Logic /mp3_cpu/thepipeline/d_mread_l
add wave -noupdate -format Logic /mp3_cpu/u_1/d_mwrite_l
add wave -noupdate -format Literal /mp3_cpu/thepipeline/d_datain
add wave -noupdate -format Literal /mp3_cpu/d_addressout
add wave -noupdate -format Literal /mp3_cpu/u_1/d_address
add wave -noupdate -format Literal /mp3_cpu/u_1/d_dataout
add wave -noupdate -format Literal /mp3_cpu/thepipeline/dest
add wave -noupdate -format Literal /mp3_cpu/thepipeline/dest_id
add wave -noupdate -format Literal /mp3_cpu/thepipeline/destreg_ex
add wave -noupdate -format Literal /mp3_cpu/thepipeline/destreg_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1144 ns} 0}
configure wave -namecolwidth 293
configure wave -valuecolwidth 40
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
WaveRestoreZoom {864 ns} {1326 ns}
