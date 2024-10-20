# Create work library (if not already exist)
vlib work

# Compile verilog files
vlog -work work in_to_hidden.v

# simulate the file
vsim work.in_to_hidden_tb

add wave -position insertpoint sim:/in_to_hidden_tb/UUT/*

# Run the simulation
# run -all

# Run for 100ns
# run 100ns

# Run for 1ms
run 1ms
