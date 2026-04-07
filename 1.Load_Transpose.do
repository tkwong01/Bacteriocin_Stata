* 1. Load the renamed file (The one with v1, v2 labels)
import delimited "MTMG_Renamed.txt", delimiter(tab) clear 

* 2. Install sxpose if you don't have it (only needs to be done once)
ssc install sxpose

* 3. Transpose while keeping the first column (v1, v2...) as headers
* 'firstnames' tells Stata to use the current first column as the new variable names
sxpose, clear firstnames

* 4. Now all your columns are named v1, v2, v3... 
* Let's add the 'g_' prefix to all of them
foreach var of varlist v* {
    rename `var' g_`var'
}

* 5. The first column created by sxpose is usually called _varname (the old sample headers)
* Rename it to something useful
rename _varname Sample_ID

* 6. Export
export delimited using "MTMG_Transposed_Final.txt", delimiter(tab) replace
