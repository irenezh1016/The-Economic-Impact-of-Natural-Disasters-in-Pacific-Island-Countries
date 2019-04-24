* Merge Macro with EMDAT ===========================================================================================================================================================
* Every macro variables are in billions, population is in million, GDPPC is in USD unit

clear 
set more off
cd "Q:\Data\PIU"
use Macro.dta
merge 1:1 Year Country using EMDAT.dta
destring, replace
drop _merge
save "merge1.dta",replace


*Reshape additional US AUS data
clear
import excel "additionaldata.xlsx", sheet("Sheet2") firstrow
reshape long Year, i(A) j(year)
encode A, gen (var)
drop A
reshape wide Year, i(year) j(var)

//rename all the vars 

rename Year1 AUS_NGDPPC
rename Year2 AUS_RGDP
rename Year3 AUS_RGDPPC
rename Year4 AUS_TT
rename Year5 US_NGDPPC
rename Year6 US_RGDP
rename Year7 US_RGDPPC
rename Year8 US_TT
rename year Year

save "addtional.dta",replace

*Merge additional AUS US data with EMDAT data
clear
use "Q:\Data\PIU\Natural_Disaster_Database\Irene_results\Codes\addtional.dta",replace
merge 1:m Year using Q:\Data\PIU\Natural_Disaster_Database\Irene_results\Codes\merge1

drop _merge
*========================================================================================================*

* Clean up false zeros from the merge
foreach x of varlist totaldamage TotalAffected totalaffected affected homeless injured totaldeaths Storm_damage Storm_affpop Flood_damage Flood_affpop Drought_damage Drought_affpop Earthquake_damage Earthquake_affpop Others_damage Others_affpop {
replace `x'= . if `x' == 0
}

* Generate variables for regression

generate intensity= (totaldeaths + 0.3*totalaffected)/(Population*10000)
rename TotalAffected Total_affpop
rename totaldamage Total_damage
*generate NGDPPC = NGDPD*1000/Population //in USD unit
generate NGDPPC = (NGDPD*1000/Population)/1000000000 //in billion
generate GDPPC = (RGDP*1000/Population)/1000000000 //in billion

** Fixed effectes regression setup

//Generate nd_pc by using both Damage/GDP and Pop affected

egen dmgrank = rank(Total_damage_p)

egen poprank = rank(Total_affpop_p)

egen maxdmg = max(dmgrank)
gen dmg_pc = dmgrank/maxdmg

egen maxpop = max(poprank)
gen pop_pc = poprank/maxpop

gen nd_pc = dmg_pc
//replace nd_pc = pop_pc if pop_pc > dmg_pc 
replace nd_pc = pop_pc if nd_pc >=.


xtile quart20 = nd_pc , nq(20)
replace quart20=0 if quart20>=.

// Generate new 70 percentile dummy using (i) Damage/GDP and (ii) Population affected 

gen DP65 = 0 // 60 percentile dummy, Not significant 
replace DP65 = 1 if quart20 > 13

gen DP70 = 0 //70 percentile dummy
replace DP70 = 1 if quart20 > 14

gen DP75 = 0 //75 percentile dummy
replace DP75 = 1 if quart20 > 15

gen DP80 = 0 //80 percentile dummy
replace DP80 = 1 if quart20 >16


// Generate 75 percentile dummies based on disaster types using(i) Damage/GDP and (ii) Population affected 

local nd Storm Flood Drought Earthquake Others
 foreach x of local nd {
	gen `x'_D75 = 0 
	replace `x'_D75 = 1 if DP75==1 & `x' == 1
}

** Based on 75 percentile, get the impact of higher percentile by using i.quart

gen quart75 = quart20
replace quart75 = 1 if quart75 <16

///**Year FE**///

xtset Country_Code Year

//Growth
**GDP
set more off

xtreg dlnRGDP DP75 L.lnRGDP i.Year if Year>1994, fe vce(robust)
outreg2 using GDP_75p_Year.xls, replace

xtreg dlnRGDP DP75 L.lnRGDP L.lnpop L.lninf L.open dlnTTAUS_TSAUS dlnTTUS_TSUS i.Year if Year>1994, fe vce(robust)
outreg2 using GDP_75p_Year.xls, append

xtreg dlnRGDP i.quart75_new L.lnRGDP i.Year if Year>1994, fe vce(robust)
outreg2 using GDP_75p_Year.xls, append

xtreg dlnRGDP i.quart75_new L.lnRGDP L.lnpop L.lninf L.open dlnTTAUS_TSAUS dlnTTUS_TSUS i.Year if Year>1994, fe vce(robust)
outreg2 using GDP_75p_Year.xls, append

**GDPPC
xtreg dlnGDPPC DP75 L.lnGDPPC i.Year if Year>1994, fe vce(robust)
outreg2 using GDP_75p_Year.xls, append

xtreg dlnGDPPC DP75 L.lnGDPPC L.lnpop L.lninf L.open dlnTTAUS_TSAUS dlnTTUS_TSUS  i.Year if Year>1994, fe vce(robust)
outreg2 using GDP_75p_Year.xls, append

xtreg dlnGDPPC i.quart75_new L.lnGDPPC i.Year if Year>1994, fe vce(robust)
outreg2 using GDP_75p_Year.xls, append

xtreg dlnGDPPC i.quart75_new L.lnGDPPC L.lnpop L.lninf L.open dlnTTAUS_TSAUS dlnTTUS_TSUS  i.Year if Year>1994, fe vce(robust)
outreg2 using GDP_75p_Year.xls, append

