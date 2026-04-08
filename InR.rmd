* 1. Load the renamed file (The one with v1, v2 labels)
import delimited "MTMG_Renamed.txt", delimiter(tab) clear 

* 2. Install sxpose if you don't have it (only needs to be done once)
ssc install sxpose

* 3. Transpose while keeping the first column (v1, v2...) as headers
* 'firstnames' tells Stata to use the current first column as the new variable names
sxpose, clear firstnames

* 6. Export
export delimited using "/cluster/tufts/hussainlab/tkwong01/VMRC/MTMG_outs/VIRGO2_results/Merged_dir/3.MTMG_Transposed_Renamed.txt", delimiter(tab) replace
