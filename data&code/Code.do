*Public complaint sentiment against air pollution in China

use "Data for complaint sentiment regression.dta"

************************
*Supplementary Table 3
************************
sum liwc15_score hedono_score liwc15_anx liwc15_anger liwc15_sad PM25 AQI PM10 temperature precipitation avewind
************************
*Supplementary Table 4
************************
global control "temperature temp2 precipitation avewind"

*1
reghdfe liwc15_score PM25 $control, absorb(i.citycode i.datecode) vce(robust)  //city-day FE
outreg2 using S3.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label
*2
reghdfe liwc15_score PM25 $control, absorb(i.citycode i.datecode) vce(cluster procode)  //city-day FE, cluster province
outreg2 using S3.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label
*3
reghdfe liwc15_score PM25 $control, absorb(i.citycode i.week) vce(robust)  //city-week FE
outreg2 using S3.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label
*4
reghdfe liwc15_score PM25 $control, absorb(i.citycode i.month) vce(robust)  //city-month FE
outreg2 using S3.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label
*5
reghdfe liwc15_score PM25 $control, absorb(i.citycode i.year) vce(robust) //city-year FE
outreg2 using S3.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label
*6
reghdfe liwc15_score PM25 $control, absorb(i.procode i.datecode) vce(robust) //province-day FE
outreg2 using S3.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label
*7
reghdfe liwc15_score PM25 $control, absorb(i.citymo i.datecode) vce(robust)    
outreg2 using S3.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label
*8
reghdfe liwc15_score PM25 $control if citylevel <= 2, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S3.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label
*9
reghdfe hedono_score PM25 $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S3.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

************************
*Supplementary Table 5
************************

ivregress 2sls liwc15_score $control i.citycode i.datecode (PM25 = ave_winddirection), r

************************
*Supplementary Table 6
************************
*PM2.5
reghdfe liwc15_score PM25 $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-PM25.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

reghdfe liwc15_anx PM25 $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-PM25.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

reghdfe liwc15_anger PM25 $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-PM25.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

reghdfe liwc15_sad PM25 $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-PM25.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

*AQI
reghdfe liwc15_score AQI $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-AQI.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

reghdfe liwc15_anx AQI $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-AQI.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

reghdfe liwc15_anger AQI $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-AQI.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

reghdfe liwc15_sad AQI $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-AQI.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

*PM10
reghdfe liwc15_score PM10 $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-PM10.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

reghdfe liwc15_anx PM10 $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-PM10.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

reghdfe liwc15_anger PM10 $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-PM10.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label

reghdfe liwc15_sad PM10 $control, absorb(i.citycode i.datecode) vce(robust)
outreg2 using S6-PM10.xls, append se dec(3)  addstat(Obs., e(N), Adjusted R-Square, e(r2_a)) nor2 noobs label


************************
*Supplementary Table 7
************************
use "Data for complaint case regression.dta"
global control "temperature temp2 precipitation avewind"

poisson num_permillionpop PM25 $control i.citycode i.datecode, vce(robust)

poisson num_permillionpop AQI $control i.citycode i.datecode, vce(robust)

poisson num_permillionpop PM10 $control i.citycode i.datecode, vce(robust)


************************
*Supplementary Table 8-11
************************
use "Data for complaint sentiment regression.dta"
* plan 1

reghdfe liwc15_score PM25 $control if key == 1, absorb(i.citycode i.datecode) vce(robust)
reghdfe liwc15_score PM25 $control if key == 0, absorb(i.citycode i.datecode) vce(robust) 


* plan 2
reghdfe liwc15_score PM25 $control if civilized6 == 1, absorb(i.citycode i.datecode) vce(robust) 
reghdfe liwc15_score PM25 $control if civilized6 == 0, absorb(i.citycode i.datecode) vce(robust) 


*energy stucture of NEV
reghdfe liwc15_score PM25 $control if high_NEV == 1, absorb(i.citycode i.datecode) vce(robust)
reghdfe liwc15_score PM25 $control if high_NEV == 0, absorb(i.citycode i.datecode) vce(robust)


*energy stucture of coal consumption
reghdfe liwc15_score PM25 $control if high_coal == 1, absorb(i.citycode i.datecode) vce(robust)
reghdfe liwc15_score PM25 $control if high_coal == 0, absorb(i.citycode i.datecode) vce(robust) 

*public location

reghdfe liwc15_score PM25 $control if regioncode == 1, absorb(i.citycode i.datecode) vce(robust) 
reghdfe liwc15_score PM25 $control if regioncode == 0, absorb(i.citycode i.datecode) vce(robust) 


*pollution type
reghdfe liwc15_score PM25 $control if pocode == 1 |pocode== 6, absorb(i.citycode i.datecode) vce(robust)
reghdfe liwc15_score PM25 $control if pocode == 2, absorb(i.citycode i.datecode) vce(robust)
reghdfe liwc15_score PM25 $control if pocode == 3|pocode == 5, absorb(i.citycode i.datecode) vce(robust) 

*pollution source

reghdfe liwc15_score PM25 $control if ind_sec == 1, absorb(i.citycode i.datecode) vce(robust) 
reghdfe liwc15_score PM25 $control if ind_sec == 0, absorb(i.citycode i.datecode) vce(robust) 


**season
reghdfe liwc15_score PM25 $control if winter == 1, absorb(i.citycode i.datecode) vce(robust) 
reghdfe liwc15_score PM25 $control if winter == 0, absorb(i.citycode i.datecode) vce(robust) 

**holiday
reghdfe liwc15_score PM25 $control if holiday == 1, absorb(i.citycode i.datecode) vce(robust) 
reghdfe liwc15_score PM25 $control if holiday == 0, absorb(i.citycode i.datecode) vce(robust) 


**complain channel
reghdfe liwc15_score PM25 $control if waycode == 1, absorb(i.citycode i.datecode) vce(robust) 
reghdfe liwc15_score PM25 $control if waycode == 2, absorb(i.citycode i.datecode) vce(robust) 
reghdfe liwc15_score PM25 $control if waycode == 3, absorb(i.citycode i.datecode) vce(robust) 
