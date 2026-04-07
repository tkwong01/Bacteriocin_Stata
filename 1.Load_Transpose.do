* 1. Load the merged file
import delimited "/cluster/tufts/hussainlab/tkwong01/VMRC/MTMG_outs/VIRGO2_results/MTMG_Merged.txt", delimiter(tab) clear 

* 2. Store the first column (the names) so we can use them as headers after transposing
* We assume your first column is named 'v1' or 'id'
local id_col = v1[1]

* 3. Transpose the data
* 'clear' replaces the data in memory
* 'varname' creates a new variable called _varname containing the old headers
xpose, clear varname

* 4. Rename variables to add the g_ prefix
* In Stata, after xpose, columns are named v1, v2, v3, etc.
* We loop through all variables except the one that holds our new row IDs
foreach var of varlist v* {
    local oldlabel : var label `var'
    rename `var' g_`var'
}

* 5. Save the result
export delimited using "MTMG_Transposed_Stata.txt", delimiter(tab) replace
