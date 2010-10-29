onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider ID
add wave -noupdate -format Literal /mp3_cpu/thepipeline/adj6_id
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
add wave -noupdate -format Literal /mp3_cpu/thepipeline/d_datain
add wave -noupdate -format Literal /mp3_cpu/d_addressout
add wave -noupdate -format Literal /mp3_cpu/thepipeline/dest
add wave -noupdate -format Literal /mp3_cpu/thepipeline/dest_id
add wave -noupdate -format Literal /mp3_cpu/thepipeline/destreg_ex
add wave -noupdate -format Literal /mp3_cpu/thepipeline/destreg_mem
add wave -noupdate -divider General
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
add wave -noupdate -format Literal /mp3_cpu/thepipeline/theregfile/ram
add wave -noupdate -format Literal -height 18 /mp3_cpu/thepipeline/theregfile/ram(7)
add wave -noupdate -format Literal -height 18 /mp3_cpu/thepipeline/theregfile/ram(6)
add wave -noupdate -format Literal -height 18 /mp3_cpu/thepipeline/theregfile/ram(5)
add wave -noupdate -format Literal -height 18 /mp3_cpu/thepipeline/theregfile/ram(4)
add wave -noupdate -format Literal -height 18 /mp3_cpu/thepipeline/theregfile/ram(3)
add wave -noupdate -format Literal -height 18 /mp3_cpu/thepipeline/theregfile/ram(2)
add wave -noupdate -format Literal -height 18 /mp3_cpu/thepipeline/theregfile/ram(1)
add wave -noupdate -format Literal -height 18 /mp3_cpu/thepipeline/theregfile/ram(0)
add wave -noupdate -divider Cache
add wave -noupdate -divider {i cache}
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/i_l1cache/d_mapped_controller/current_state
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/i_l1cache/address
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/i_l1cache/mread_l
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/i_l1cache/pmdatain
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/i_l1cache/pmresp_h
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/i_l1cache/mresp_h
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/i_l1cache/datain
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/i_l1cache/pmaddress
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/i_l1cache/pmdataout
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/i_l1cache/pmread_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/i_l1cache/pmwrite_l
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/i_l1cache/ad_mapped_cache1k/adataarray1k/data
add wave -noupdate -divider {d cache}
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/d_l1cache/d_mapped_controller/current_state
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/d_l1cache/mread_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/d_l1cache/mwriteh_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/d_l1cache/mwritel_l
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/d_l1cache/address
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/d_l1cache/dataout
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/d_l1cache/pmdatain
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/d_l1cache/pmresp_h
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/d_l1cache/datain
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/d_l1cache/mresp_h
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/d_l1cache/pmaddress
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/d_l1cache/pmdataout
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/d_l1cache/pmread_l
add wave -noupdate -format Logic /mp3_cpu/thecacheblock/d_l1cache/pmwrite_l
add wave -noupdate -format Literal /mp3_cpu/thecacheblock/d_l1cache/ad_mapped_cache1k/adataarray1k/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3775 ns} 0}
configure wave -namecolwidth 365
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
WaveRestoreZoom {0 ns} {1782 ns}
