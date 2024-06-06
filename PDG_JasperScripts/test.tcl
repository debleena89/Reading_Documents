

analyze -verilog arbiter.v top.v 

analyze -sva binding.sva v.sva

elaborate -top top

# Set up Clocks and Resets
clock clk
reset ~rstn
#
# # Get design information to check general complexity
get_design_info
#
# # Prove properties
# # 1st pass: Quick validation of properties with default engines
set_max_trace_length 10
prove -all
# #
# # 2nd pass: Validation of remaining properties with different engine
set_max_trace_length 50
set_prove_per_property_time_limit 30s
set_engine_mode {K I N}
prove -all
#
# # Report proof results
report
#
