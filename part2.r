## ---- results='hide', message=FALSE-------------------------------------------
include <- function(library_name){
  if( !(library_name %in% installed.packages()) )
    install.packages(library_name) 
  library(library_name, character.only=TRUE)
}
include("tidyverse")
include("rvest")
include("tidyr")
include("knitr")
#purl("deliverable1.Rmd", output = "part1.r")
source("part1.r")


## -----------------------------------------------------------------------------
html <- read_html("https://nces.ed.gov/programs/digest/d17/tables/dt17_211.60.asp")

values <- html %>% 
              html_nodes("td.TblCls008") %>%
              html_text()

values2 <- html %>%
            html_nodes("td.TblCls003") %>%
            html_text()

United_States <- values2[1:15]
United_States <- gsub("[$]", "", United_States)
Alabama <- values[1:15]
Alaska <- values[16:30]
Arizona	<- values[31:45]
Arkansas <- values[46:60]
California <- values[61:75]
Colorado 	 <- values[89:103]
Connecticut	 <- values[104:118]
Delaware  <- values[119:133]
District_of_Columbia  <- values[149:163]
Florida  <- values[164:178]
Georgia	<- values[192:206]
Hawaii <- values[207:221]
Idaho	<- values[222:236]
Illinois <- values[237:251]
Indiana	<- values[252:266]
Iowa <- values[280:294]
Kansas <- values[295:309]
Kentucky <- values[310:324]
Louisiana	<- values[325:339]
Maine	<- values[340:354]
Maryland <- values[368:382]
Massachusetts	<- values[383:397]
Michigan <- values[398:412]
Minnesota	 <- values[413:427]
Mississippi	<- values[428:442]
Missouri <- values[456:470]
Montana	<- values[471:485]
Nebraska <- values[486:500]
Nevada <- values[501:515]
New_Hampshire	<- values[516:530]
New_Jersey <- values[544:558]
New_Mexico <- values[559:573]
New_York <- values[574:588]
North_Carolina <- values[589:603]
North_Dakota <- values[604:618] 	 	 	 	 	 
Ohio <- values[632:646]
Oklahoma <- values[647:661]
Oregon <- values[662:676]
Pennsylvania <- values[677:691]
Rhode_Island <- values[692:706] 	 	 
South_Carolina <- values[720:734]
South_Dakota <- values[735:749]
Tennessee	<- values[750:764]
Texas <- values[765:779]
Utah <- values[780:794] 	 	 	 	 	 
Vermont <- values[808:822]
Virginia <- values[823:837]
Washington <- values[838:852]
West_Virginia <- values[853:867]
Wisconsin <- values[868:882]
Wyoming <- values2[16:30]


## -----------------------------------------------------------------------------
Categories <- c("Current_Dollars:1969-70",	"Current_Dollars:1979-80",	"Current_Dollars:1989-90",	"Current_Dollars:1999-2000",	"Current_Dollars:2009-10",	"Current_Dollars:2015-16",	"Current_Dollars:2016-17",	"Constant_2016-17_dollars:1969-70",	"Constant_2016-17_dollars:1979-80",	"Constant_2016-17_dollars:1989-90",	"Constant_2016-17_dollars:1999-2000",	"Constant_2016-17_dollars:2009-10",	"Constant_2016-17_dollars:2015-16",	"Constant_2016-17_dollars:2016-17",	"Percent_change_1999-2000_to_2016-17")

salaries <- tibble(Categories = Categories, US = United_States, AL = Alabama, AK = Alaska, AZ = Arizona, AR = Arkansas, CA = California, CO = Colorado, CT = Connecticut, DE = Delaware, DC = District_of_Columbia, FL = Florida, GA = Georgia, HI = Hawaii, ID = Idaho, IL = Illinois, IN = Indiana, IA = Iowa, KS = Kansas, KY = Kentucky, LA = Louisiana, ME = Maine, MD = Maryland, MA = Massachusetts, MI = Michigan, MN = Minnesota, MS = Mississippi, MO = Missouri, MT = Montana, NE = Nebraska, NV = Nevada, NH = New_Hampshire, NJ = New_Jersey, NM = New_Mexico, NY = New_York, NC = North_Carolina, ND = North_Dakota, OH = Ohio, OK = Oklahoma, OR = Oregon, PA = Pennsylvania, RI = Rhode_Island, SC = South_Carolina, SD = South_Dakota, TN = Tennessee, TX = Texas, UT = Utah, VT = Vermont, VA = Virginia, WA = Washington, WV = West_Virginia, WI = Wisconsin, WY = Wyoming)
salaries


## -----------------------------------------------------------------------------
salaries <- gather(salaries, key = "State", value = "amount", -Categories)
salaries <- spread(salaries, Categories, amount)
salaries

salaries <- sapply(salaries, gsub, pattern=',', replacement='')
salaries <- as_tibble(salaries)


## -----------------------------------------------------------------------------
education_numbers <- tibble("FIPS_Code" = education_attainment$FIPS_Code, "State" = education_attainment$State, "1970_Less_Than_High_School_Diploma" = education_attainment$`1970_Less_Than_High_School_Diploma`, "1970_High_School_Diploma_Only" = education_attainment$`1970_High_School_Diploma_Only`, "1970_Some_College" = education_attainment$`1970_Some_College`, "1970_Bachelor_Degree_Or_Higher" = education_attainment$`1970_Bachelor_Degree_Or_Higher`, "1980_Less_Than_High_School_Diploma" = education_attainment$`1980_Less_Than_High_School_Diploma`, "1980_High_School_Diploma_Only" = education_attainment$`1980_High_School_Diploma_Only`, "1980_Some_College" = education_attainment$`1980_Some_College`, "1980_Bachelor_Degree_Or_Higher" = education_attainment$`1980_Bachelor_Degree_Or_Higher`, "1990_Less_Than_High_School_Diploma" = education_attainment$`1990_Less_Than_High_School_Diploma`, "1990_High_School_Diploma_Only" = education_attainment$`1990_High_School_Diploma_Only`, "1990_Some_College" = education_attainment$`1990_Some_College`, "1990_Bachelor_Degree_Or_Higher" = education_attainment$`1990_Bachelor_Degree_Or_Higher`, "2000_Less_Than_High_School_Diploma" = education_attainment$`2000_Less_Than_High_School_Diploma`, "2000_High_School_Diploma_Only" = education_attainment$`2000_High_School_Diploma_Only`, "2000_Some_College" = education_attainment$`2000_Some_College`, "2000_Bachelor_Degree_Or_Higher" = education_attainment$`2000_Bachelor_Degree_Or_Higher`, "2013-17_Less_Than_High_School_Diploma" = education_attainment$`2013-17_Less_Than_High_School_Diploma`, "2013-17_High_School_Diploma_Only" = education_attainment$`2013-17_High_School_Diploma_Only`, "2013-17_Some_College" = education_attainment$`2013-17_Some_College`, "2013-17_Bachelor_Degree_Or_Higher" = education_attainment$`2013-17_Bachelor_Degree_Or_Higher`)

education_sum_numbers <- aggregate(cbind("1970_Less_Than_High_School_Diploma" = education_numbers$`1970_Less_Than_High_School_Diploma`, "1970_High_School_Diploma_Only" = education_numbers$`1970_High_School_Diploma_Only`, "1970_Some_College" = education_numbers$`1970_Some_College`, "1970_Bachelor_Degree_Or_Higher" = education_numbers$`1970_Bachelor_Degree_Or_Higher`, "1980_Less_Than_High_School_Diploma" = education_numbers$`1980_Less_Than_High_School_Diploma`,  "1980_High_School_Diploma_Only" = education_numbers$`1980_High_School_Diploma_Only`, "1980_Some_College" = education_numbers$`1980_Some_College`, "1980_Bachelor_Degree_Or_Higher" = education_numbers$`1980_Bachelor_Degree_Or_Higher`,  "1990_Less_Than_High_School_Diploma" = education_numbers$`1990_Less_Than_High_School_Diploma`,  "1990_High_School_Diploma_Only" = education_numbers$`1990_High_School_Diploma_Only`, "1990_Some_College" = education_numbers$`1990_Some_College`, "1990_Bachelor_Degree_Or_Higher" = education_numbers$`1990_Bachelor_Degree_Or_Higher`, "2000_Less_Than_High_School_Diploma" = education_numbers$`2000_Less_Than_High_School_Diploma`,  "2000_High_School_Diploma_Only" = education_numbers$`2000_High_School_Diploma_Only`, "2000_Some_College" = education_numbers$`2000_Some_College`, "2000_Bachelor_Degree_Or_Higher" = education_numbers$`2000_Bachelor_Degree_Or_Higher`, "2013-17_Less_Than_High_School_Diploma" = education_numbers$`2013-17_Less_Than_High_School_Diploma`, "2013-17_High_School_Diploma_Only" = education_numbers$`2013-17_High_School_Diploma_Only`, "2013-17_Some_College" = education_numbers$`2013-17_Some_College`, "2013-17_Bachelor_Degree_Or_Higher" = education_numbers$`2013-17_Bachelor_Degree_Or_Higher`), by=list(State=education_numbers$State), FUN=sum, na.rm=TRUE)


## -----------------------------------------------------------------------------
education_sum_numbers <- inner_join(salaries, education_sum_numbers, by = "State")
education_sum_numbers


## -----------------------------------------------------------------------------
sapply(education_sum_numbers, typeof)

education_sum_numbers$`Constant_2016-17_dollars:1969-70` <- as.double(education_sum_numbers$`Constant_2016-17_dollars:1969-70`)
education_sum_numbers$`Constant_2016-17_dollars:1979-80` <- as.double(education_sum_numbers$`Constant_2016-17_dollars:1979-80`)
education_sum_numbers$`Constant_2016-17_dollars:1989-90` <- as.double(education_sum_numbers$`Constant_2016-17_dollars:1989-90`)
education_sum_numbers$`Constant_2016-17_dollars:1999-2000` <- as.double(education_sum_numbers$`Constant_2016-17_dollars:1999-2000`)
education_sum_numbers$`Constant_2016-17_dollars:2009-10` <- as.double(education_sum_numbers$`Constant_2016-17_dollars:2009-10`)
education_sum_numbers$`Constant_2016-17_dollars:2015-16` <- as.double(education_sum_numbers$`Constant_2016-17_dollars:2015-16`)
education_sum_numbers$`Constant_2016-17_dollars:2016-17` <- as.double(education_sum_numbers$`Constant_2016-17_dollars:2016-17`)
education_sum_numbers$`Current_Dollars:1969-70` <- as.double(education_sum_numbers$`Current_Dollars:1969-70`)
education_sum_numbers$`Current_Dollars:1979-80` <- as.double(education_sum_numbers$`Current_Dollars:1979-80`)
education_sum_numbers$`Current_Dollars:1989-90` <- as.double(education_sum_numbers$`Current_Dollars:1989-90`)
education_sum_numbers$`Current_Dollars:1989-90` <- as.double(education_sum_numbers$`Current_Dollars:1989-90`)
education_sum_numbers$`Current_Dollars:1999-2000` <- as.double(education_sum_numbers$`Current_Dollars:1999-2000`)
education_sum_numbers$`Current_Dollars:2009-10` <- as.double(education_sum_numbers$`Current_Dollars:2009-10`)
education_sum_numbers$`Current_Dollars:2015-16` <- as.double(education_sum_numbers$`Current_Dollars:2015-16`)
education_sum_numbers$`Current_Dollars:2016-17` <- as.double(education_sum_numbers$`Current_Dollars:2016-17`)
education_sum_numbers$`Percent_change_1999-2000_to_2016-17` <- as.double(education_sum_numbers$`Percent_change_1999-2000_to_2016-17`)

sapply(education_sum_numbers, typeof)
sapply(education_sum_numbers, is.factor)


## -----------------------------------------------------------------------------
ggplot(education_sum_numbers, aes(State, `Percent_change_1999-2000_to_2016-17`)) + geom_point() +
  labs( x = "State", y = "Salary Percent Change", 
  title ="Salary Percent Change by State") + 
  theme(axis.text.x = element_text(size = 9, angle=90), axis.text.y = element_text(size=14)) + 
  scale_y_continuous()

library(caret)
set.seed(125)
sample_selection <- createDataPartition(education_sum_numbers$`Percent_change_1999-2000_to_2016-17`, p = 0.75, list = FALSE)
train <- education_sum_numbers[sample_selection, ]
test <- education_sum_numbers[-sample_selection, ]

train_model <- lm(train, formula =  `Percent_change_1999-2000_to_2016-17` ~ `1970_Less_Than_High_School_Diploma` + `1970_High_School_Diploma_Only` + `1970_Some_College` + `1970_Bachelor_Degree_Or_Higher` + `1980_Less_Than_High_School_Diploma` + `1980_High_School_Diploma_Only` + `1980_Some_College` + `1980_Bachelor_Degree_Or_Higher` + `1990_Less_Than_High_School_Diploma` + `1990_High_School_Diploma_Only` + `1990_Some_College` + `1990_Bachelor_Degree_Or_Higher` + `2000_Less_Than_High_School_Diploma` + `2000_High_School_Diploma_Only` + `2000_Some_College` + `2000_Bachelor_Degree_Or_Higher` + `2013-17_Less_Than_High_School_Diploma` + `2013-17_High_School_Diploma_Only` + `2013-17_Some_College`)

summary(train_model)


## -----------------------------------------------------------------------------
prediction <- train_model %>% predict(test)

R2(prediction, test$`Percent_change_1999-2000_to_2016-17`)
MAE(prediction, test$`Percent_change_1999-2000_to_2016-17`)
RMSE(prediction, test$`Percent_change_1999-2000_to_2016-17`)

ggplot(test, aes(x = prediction, y = `Percent_change_1999-2000_to_2016-17`)) + geom_point()

