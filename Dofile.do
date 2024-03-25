clear all
cd "F:\TeIAS Gradschool\Metrics 1\Projects\Sadeqi_Hamed"

odbc load, table("R1400P1") dsn("heis1400")
generate ur = 0
save "Data and Code/R1400" , replace


clear all 

odbc load, table("R1400Data") dsn("heis1400")
keep weight Address
save "Data and Code/wr1400" , replace

use "Data and Code/R1400"
merge m:1 Address using "Data and Code/wr1400", keepusing(weight)
save "Data and Code/R1400F", replace

clear all

odbc load, table("U1400P1") dsn("heis1400")
generate ur = 1
save "Data and Code/U1400" , replace


clear all 

odbc load, table("U1400Data") dsn("heis1400")
keep weight Address
save "Data and Code/wu1400" , replace

use "Data and Code/U1400"
merge m:1 Address using "Data and Code/wu1400", keepusing(weight)
save "Data and Code/U1400F", replace

use "Data and Code/U1400F"

append using "Data and Code/R1400F"
save "Data and Code/P1400" , replace

use "Data and Code/P1400"
keep DYCOL03 DYCOL04 DYCOL05 DYCOL06 DYCOL07 DYCOL08 DYCOL09 DYCOL10 weight Address ur

rename (DYCOL03 DYCOL04 DYCOL05 DYCOL06 DYCOL07 DYCOL08 DYCOL09 DYCOL10 weight Address ur)(relate gender age lit edustate educ wstate marr weight Address ur)

destring relate gender age lit marr weight ur wstate educ edustate, replace force

save "Data and Code/P1400" , replace
//----------------------------------------
clear all

odbc load, table("R1400P3S01") dsn("heis1400")
keep DYCOL06 Address
destring DYCOL06, replace force
save "Data and Code/R1400P3S01" , replace

clear all 

odbc load, table("U1400P3S01") dsn("heis1400")
keep DYCOL06 Address
destring DYCOL06, replace force

save "Data and Code/U1400P3S01" , replace

clear all 

odbc load, table("R1400P3S02") dsn("heis1400")
keep DYCOL06 Address
destring DYCOL06, replace force

save "Data and Code/R1400P3S02" , replace

clear all

odbc load, table("U1400P3S02") dsn("heis1400")
keep DYCOL06 Address
destring DYCOL06, replace force

save "Data and Code/U1400P3S02" , replace


append using "Data and Code/U1400P3S01"
append using "Data and Code/R1400P3S01"
append using "Data and Code/R1400P3S02"
collapse (sum) DYCOL06 ,by(Address)

save "Data and Code/U1400P3S1" , replace


//_____________________ 
clear all

odbc load, table("U1400P3S03") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/U1400P3S03" , replace


clear all 

odbc load, table("U1400P3S05") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/U1400P3S05" , replace

clear all 

odbc load, table("U1400P3S06") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/U1400P3S06" , replace


clear all 

odbc load, table("U1400P3S07") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/U1400P3S07" , replace

clear all 

odbc load, table("U1400P3S08") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/U1400P3S08" , replace

clear all 

odbc load, table("U1400P3S09") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/U1400P3S09" , replace

clear all 

odbc load, table("U1400P3S11") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/U1400P3S11" , replace


clear all 

odbc load, table("U1400P3S12") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/U1400P3S12" , replace


append using "Data and Code/U1400P3S03"
append using "Data and Code/U1400P3S05"
append using "Data and Code/U1400P3S06"
append using "Data and Code/U1400P3S07"
append using "Data and Code/U1400P3S08"
append using "Data and Code/U1400P3S09"
append using "Data and Code/U1400P3S11"
collapse (sum) DYCOL03 ,by(Address)


save "Data and Code/U1400P3S2" , replace




///--------------

clear all 

odbc load, table("R1400P3S03") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/R1400P3S03" , replace


clear all 

odbc load, table("R1400P3S05") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/R1400P3S05" , replace

clear all 

odbc load, table("R1400P3S06") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/R1400P3S06" , replace


clear all 

odbc load, table("R1400P3S07") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/R1400P3S07" , replace

clear all 

odbc load, table("R1400P3S08") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/R1400P3S08" , replace

clear all 

odbc load, table("R1400P3S09") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/R1400P3S09" , replace

clear all 

odbc load, table("R1400P3S11") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/R1400P3S11" , replace


clear all 

odbc load, table("R1400P3S12") dsn("heis1400")
keep DYCOL03 Address
destring DYCOL03, replace force

save "Data and Code/R1400P3S12" , replace


append using "Data and Code/R1400P3S03"
append using "Data and Code/R1400P3S05"
append using "Data and Code/R1400P3S06"
append using "Data and Code/R1400P3S07"
append using "Data and Code/R1400P3S08"
append using "Data and Code/R1400P3S09"
append using "Data and Code/R1400P3S11"
collapse (sum) DYCOL03 ,by(Address)


save "Data and Code/R1400P3S2" , replace


//________________________
clear all 

odbc load, table("R1400P3S04") dsn("heis1400")
keep DYCOL04 Address
destring DYCOL04, replace force

save "Data and Code/R1400P3S04" , replace


clear all 

odbc load, table("U1400P3S04") dsn("heis1400")
keep DYCOL04 Address
destring DYCOL04, replace force

save "Data and Code/U1400P3S04" , replace

append using "Data and Code/R1400P3S04"
collapse (sum) DYCOL04 ,by(Address)

save "Data and Code/R1400P3S4" , replace

///-----------------------
clear all



use "Data and Code/P1400"

merge m:1 Address using "Data and Code/R1400P3S4" , nogenerate
save "Data and Code/P1400" , replace

clear all
use "Data and Code/P1400"
merge m:1 Address using "Data and Code/R1400P3S2" , nogenerate
save "Data and Code/P1400" , replace
clear all

use "Data and Code/P1400"
merge m:1 Address using "Data and Code/U1400P3S2" , nogenerate
save "Data and Code/P1400" , replace
clear all

use "Data and Code/P1400"
merge m:1 Address using "Data and Code/U1400P3S1", nogenerate

replace DYCOL03 = 0 if DYCOL03 == .
gen expd = DYCOL04 + DYCOL03 + DYCOL06

save "Data and Code/P1400" , replace


///%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all



use "Data and Code/wr1400"
keep Address weight
destring weight, replace
save "Data and Code/wr1400", replace
clear all

use "Data and Code/R1400"
keep Address DYCOL03
rename (DYCOL03)(relate)
destring relate, replace
label variable relate "Relationship of Rural"
save "Data and Code/R1400", replace
clear all

use "Data and Code/wr1400"
merge 1:m Address using "Data and Code/R1400", nogenerate
save "Data and Code/wr1400" , replace
clear all

odbc load, table("R1400P4S01") dsn("heis1400")
keep Address DYCOL15
destring DYCOL15, replace
rename DYCOL15 annsal
label variable annsal "Annual Salary"
merge m:m Address using "Data and Code/wr1400"
keep if _merge == 3
drop _merge
save "Data and Code/annsal", replace
clear all

odbc load, table("R1400P4S02") dsn("heis1400")
keep Address DYCOL15
destring DYCOL15, replace
rename DYCOL15 anninc
label variable anninc "Annual Income"
merge m:m Address using "Data and Code/wr1400"
keep if _merge == 3
drop _merge
save "Data and Code/anninc", replace
clear all

use "Data and Code/wr1400"
merge m:m Address using "Data and Code/annsal", nogenerate
merge m:m Address using "Data and Code/anninc", nogenerate
replace anninc = 0 if anninc == .
replace annsal = 0 if annsal == .
generate inc = annsal + anninc
label variable inc "Total Annual Income"
keep if relate == 1

sort Address
quietly by Address: gen dup = cond(_N==1, 0, _n)
tabulate dup
drop if dup > 0
drop dup
save "Data and Code/wr1400", replace


clear all
// Prime-U == wu1400


use "Data and Code/wu1400"
destring weight, replace
save "Data and Code/wu1400", replace
clear all

use "Data and Code/U1400"
keep Address DYCOL03
rename (DYCOL03)(relate)
destring relate, replace
label variable relate "Relationship of Urban"
save "Data and Code/U1400", replace
clear all

use "Data and Code/wu1400"
merge 1:m Address using "Data and Code/U1400", nogenerate
save "Data and Code/wu1400" , replace
clear all

odbc load, table("U1400P4S01") dsn("heis1400")
keep Address DYCOL15
destring DYCOL15, replace
rename DYCOL15 annsal
label variable annsal "Annual Salary of Urban"
merge m:m Address using "Data and Code/wu1400"
keep if _merge == 3
drop _merge
save "Data and Code/annsal-U", replace
clear all

odbc load, table("U1400P4S02") dsn("heis1400")
keep Address DYCOL15
destring DYCOL15, replace
rename DYCOL15 anninc
label variable anninc "Annual Income-U"
merge m:m Address using "Data and Code/wu1400"
keep if _merge == 3
drop _merge
save "Data and Code/anninc-U", replace
clear all

use "Data and Code/wu1400"
merge m:m Address using "Data and Code\annsal-U", nogenerate
merge m:m Address using "Data and Code\anninc-U", nogenerate
replace anninc = 0 if anninc == .
replace annsal = 0 if annsal == .
generate inc = annsal + anninc
label variable inc "Total Annual Income-U"
keep if relate == 1
sort Address
quietly by Address: gen dup = cond(_N==1, 0, _n)
tabulate dup
drop if dup > 0
drop dup
save "Data and Code/wu1400", replace

use "Data and Code/wr1400"
append using "Data and Code/wu1400"
save "Data and Code/f1400", replace
clear all

use "Data and Code/P1400"
merge m:1 Address using "Data and Code/f1400", nogenerate
save "Data and Code/P1400", replace


////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

generate age2 = age^2
generate yeduc = 0

label variable yeduc "Years of Education"
label variable relate "Individuals Relationship"
label variable gender "Individuals Gender"
label variable age "Individuals Age"
label variable lit "Individuals Literacy"
label variable marr "Marital Status"
label variable weight "Weight of Individuals"
label variable Address "Address"
label variable ur "Residence"
label variable age2 "Age Power of 2"
label variable DYCOL03 "Expenditure of Houshold in House"
label variable DYCOL06 "Expenditure of Houshold in Foods and Drinks"
label variable DYCOL03 "Expenditure of Houshold in Others"
label variable expd "Total Expenditure of Houshold"
label variable edustate "Status of Education"
label variable educ "Level of Education"
label variable wstate "Working Status"



rename(DYCOL03 DYCOL04 DYCOL06)(expd1 expd2 expd3)
replace gender = 0 if gender == 2
replace lit = 0 if lit == 2
replace marr = 0 if marr == 2
replace marr = 0 if marr == 3
replace marr = 0 if marr == 4
forvalues i = 4/11{
	replace relate = 0 if relate == `i'
}
replace edustate = 0 if edustate == 2
replace wstate = 0 if wstate == 2
replace wstate = 2 if wstate == 3
replace wstate = 3 if wstate == 4
replace wstate = 3 if wstate == 5
replace wstate = 3 if wstate == 6

replace yeduc = 5 if educ == 1
replace yeduc = 8 if educ == 2
replace yeduc = 11 if educ == 3
replace yeduc = 12 if educ == 4
replace yeduc = 14 if educ == 5
replace yeduc = 16 if educ == 6
replace yeduc = 21 if educ == 7
replace yeduc = 23 if educ == 8



label define Working_Status 0 "Unemployed" 1 "Employed" 2 "Inactive with Wage" 3 "Inactive" 
label values wstate Working_Status

label define Education_Level 1 "Elementary" 2 "Pre HighSchool" 3 "HighSchool" 4 "Diploma" 5 "Pre Bachelor" 6 "Bachelor" 7 "PHD" 8 "Post Doc" 9 "Non"
label values educ Education_Level

label define EducationalStatus 1 "Student" 0 "Not Student"
label values edustate EducationalStatus

label define Relationship 1 "Houshold" 2 "Partner" 3 "Child" 0 "Other Family"
label values relate Relationship

label values expd1 Expenditure
label values expd2 Expenditure
label values expd3 Expenditure


label define Gender 0 "Female" 1 "Male"
label values gender Gender

label values age Age
label values age2 Age2

label define Literacy 0 "Illiterate" 1 "Literate"
label values lit Literacy

label define Marital_Status 1 "Married" 0 "Single"
label values marr Marital_Status

label define Residence 1 "Urban" 0 "Rural"
label values ur Residence

save "Data and Code/P1400" , replace


////// Problem 2 ////////
//part a
est clear
eststo: reg lit gender ur age age2 marr [fweight=weight]
esttab using "Table and Graph/p2a.tex", se r2 wide  replace title(Regression table\label{tab1})

// part b

test age age2 


/// part c
predict resid , residual 
generate residsqr = resid^2
predict yhat
generate yhatsqr = yhat^2
regress residsqr yhat yhatsqr [fweight = weight]
test yhat yhatsqr

//________________________
// imtest, white

/// part d 
gen yhatssqr = yhat^3
regress lit gender ur age age2 marr yhatsqr yhatssqr [fweight = weight]
test yhatsqr yhatssqr

/// robust : reg  lit edu , vce(robust)

///Question 3
//part a 
est clear
eststo: reg expd gender ur yeduc marr inc [fweight = weight]
eststo: reg expd gender ur yeduc age marr inc [fweight = weight]
eststo: reg expd gender ur yeduc age age2 marr inc [fweight = weight]

esttab using "Table and Graph/p3a.tex", se r2 wide  replace title(Regression table\label{tab2})

// part b
est clear
eststo: reg expd gender ur yeduc marr inc [fweight = weight], vce(robust)
eststo: reg expd gender ur yeduc age marr inc [fweight = weight], vce(robust)
eststo: reg expd gender ur yeduc age age2 marr inc [fweight = weight], vce(robust)

esttab using "Table and Graph/p3b.tex", se r2 wide  replace title(Regression table\label{tab3})

// Question 4

gen employ = 0
replace employ = 1 if wstate == 1
label variable employ "Employment Status"
label define Employment 1 "Employed" 0 "Unemployed"
label values employ Employment

gen inactWage = 0
replace inactWage = 1 if wstate == 3
label variable inactWage "Wage Status of Inactive People"
label define Inactive_with_wage 1 "inactive Wage" 0 "inactive poor"
label values inactWage Inactive_with_wage

gen skilled = 0
replace skilled = 1 if educ > 4
label variable skilled "Skilled worker in Job market"
label define Skilled 1 "skilled" 0 "unskilled"
label values skilled Skilled

gen edukilled = educ*skilled
gen eduploy = educ*employ
gen skillploy = skilled*employ
gen skillur = skilled*ur
est clear
eststo: reg inc gender age edustate employ inactWage skilled ur marr age2 educ edukilled eduploy skillploy skillur[fweight = weight], vce(robust)

predict yh
gen yh2 = yh^2
gen yh3 = yh^3

est clear
eststo: reg inc gender age edustate employ inactWage skilled ur marr age2 educ yh2 yh3[fweight = weight], vce(robust)

esttab using "Table and Graph/p4.tex", se r2 wide  replace title(Regression table\label{tab4})
















