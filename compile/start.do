-------------------------------------------------
-- ECE411 MP1 force file.
-------------------------------------------------

echo "--- Executing initialization force file for mp1 ---"

echo "Setting clock period to 50 ns, starting at 50 ns."
force /clk 0  0
force /clk 0 20 -r 40
force /clk 1 40 -r 40

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5

--echo "Initializing the processor."
--force /start_h 0 @0
--force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
--force /start_h 0 @ 100

echo "Done initializing processor, ready to simulate."
