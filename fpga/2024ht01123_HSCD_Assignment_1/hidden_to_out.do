# Create work library (if not already exist)
vlib work

# Compile verilog files
vlog -work work hidden_to_out.v

# simulate the file
vsim work.hidden_to_out_tb

add wave -position insertpoint sim:/hidden_to_out_tb/UUT/*

# Run the simulation
# run -all

# Run for 100ns
# run 100ns

# Run for 1ms
run 1ms
