## ---- results='hide', message=FALSE-------------------------------------------
include <- function(library_name){
  if( !(library_name %in% installed.packages()) )
    install.packages(library_name) 
  library(library_name, character.only=TRUE)
}
#install.packages("tidyverse")
include("tidyverse")
include("dplyr")
include("tidyr")

suppressMessages(education_attainment <- read_csv("https://raw.githubusercontent.com/introdsci/DataScience-OliviaAbbott/master/Education.csv"))



## -----------------------------------------------------------------------------
colnames(education_attainment)
#sapply(education_attainment, typeof)
#sapply(education_attainment, mode)


## -----------------------------------------------------------------------------
colnames(education_attainment)[colnames(education_attainment) == "FIPS Code"] <- "FIPS_Code"
colnames(education_attainment)[colnames(education_attainment) == "Area name"] <- "Area_Name"
colnames(education_attainment)[colnames(education_attainment) == "2003 Rural-urban Continuum Code"] <- "2003_Rural_Urban_Continuum_Code"
colnames(education_attainment)[colnames(education_attainment) == "2003 Urban Influence Code"] <- "2003_Urban_Influence_Code"
colnames(education_attainment)[colnames(education_attainment) == "2013 Rural-urban Continuum Code"] <- "2013_Rural_Urban_Continuum_Code"
colnames(education_attainment)[colnames(education_attainment) == "2013 Urban Influence Code"] <- "2013_Urban_Influence_Code"

colnames(education_attainment)[colnames(education_attainment) == "Less than a high school diploma, 1970"] <- "1970_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "High school diploma only, 1970"] <- "1970_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Some college (1-3 years), 1970"] <- "1970_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Four years of college or higher, 1970"] <- "1970_Bachelor_Degree_Or_Higher"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with less than a high school diploma, 1970"] <- "1970_Percent_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with a high school diploma only, 1970"] <- "1970_Percent_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults completing some college (1-3 years), 1970"] <- "1970_Percent_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults completing four years of college or higher, 1970"] <- "1970_Percent_Bachelor_Degree_Or_Higher"

colnames(education_attainment)[colnames(education_attainment) == "Less than a high school diploma, 1980"] <- "1980_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "High school diploma only, 1980"] <- "1980_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Some college (1-3 years), 1980"] <- "1980_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Four years of college or higher, 1980"] <- "1980_Bachelor_Degree_Or_Higher"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with less than a high school diploma, 1980"] <- "1980_Percent_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with a high school diploma only, 1980"] <- "1980_Percent_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults completing some college (1-3 years), 1980"] <- "1980_Percent_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults completing four years of college or higher, 1980"] <- "1980_Percent_Bachelor_Degree_Or_Higher"

colnames(education_attainment)[colnames(education_attainment) == "Less than a high school diploma, 1990"] <- "1990_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "High school diploma only, 1990"] <- "1990_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Some college or associate's degree, 1990"] <- "1990_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Bachelor's degree or higher, 1990"] <- "1990_Bachelor_Degree_Or_Higher"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with less than a high school diploma, 1990"] <- "1990_Percent_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with a high school diploma only, 1990"] <- "1990_Percent_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults completing some college or associate's degree, 1990"] <- "1990_Percent_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with a bachelor's degree or higher, 1990"] <- "1990_Percent_Bachelor_Degree_Or_Higher"

colnames(education_attainment)[colnames(education_attainment) == "Less than a high school diploma, 2000"] <- "2000_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "High school diploma only, 2000"] <- "2000_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Some college or associate's degree, 2000"] <- "2000_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Bachelor's degree or higher, 2000"] <- "2000_Bachelor_Degree_Or_Higher"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with less than a high school diploma, 2000"] <- "2000_Percent_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with a high school diploma only, 2000"] <- "2000_Percent_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults completing some college or associate's degree, 2000"] <- "2000_Percent_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with a bachelor's degree or higher, 2000"] <- "2000_Percent_Bachelor_Degree_Or_Higher"

colnames(education_attainment)[colnames(education_attainment) == "Less than a high school diploma, 2013-17"] <- "2013-17_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "High school diploma only, 2013-17"] <- "2013-17_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Some college or associate's degree, 2013-17"] <- "2013-17_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Bachelor's degree or higher, 2013-17"] <- "2013-17_Bachelor_Degree_Or_Higher"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with less than a high school diploma, 2013-17"] <- "2013-17_Percent_Less_Than_High_School_Diploma"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with a high school diploma only, 2013-17"] <- "2013-17_Percent_High_School_Diploma_Only"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults completing some college or associate's degree, 2013-17"] <- "2013-17_Percent_Some_College"
colnames(education_attainment)[colnames(education_attainment) == "Percent of adults with a bachelor's degree or higher, 2013-17"] <- "2013-17_Percent_Bachelor_Degree_Or_Higher"


## -----------------------------------------------------------------------------
education_attainment$X48 <- NULL


## -----------------------------------------------------------------------------
location <- tibble("FIPS_Code" = education_attainment$FIPS_Code, "State" = education_attainment$State, "Area_Name" = education_attainment$Area_Name, "2003_Rural_Urban_Continuum_Code" = education_attainment$`2003_Rural_Urban_Continuum_Code`,  "2003_Urban_Influence_Code" = education_attainment$`2003_Urban_Influence_Code`, "2013_Rural_Urban_Continuum_Code" = education_attainment$`2013_Rural_Urban_Continuum_Code`, "2013_Urban_Influence_Code" = education_attainment$`2013_Urban_Influence_Code`)

education <- tibble("FIPS_Code" = education_attainment$FIPS_Code, "State" = education_attainment$State, "1970_Less_Than_High_School_Diploma" = education_attainment$`1970_Less_Than_High_School_Diploma`, "1970_High_School_Diploma_Only" = education_attainment$`1970_High_School_Diploma_Only`, "1970_Some_College" = education_attainment$`1970_Some_College`, "1970_Bachelor_Degree_Or_Higher" = education_attainment$`1970_Bachelor_Degree_Or_Higher`, "1970_Percent_Less_Than_High_School_Diploma" = education_attainment$`1970_Percent_Less_Than_High_School_Diploma`, "1970_Percent_High_School_Diploma_Only" = education_attainment$`1970_Percent_High_School_Diploma_Only`, "1970_Percent_Some_College" = education_attainment$`1970_Percent_Some_College`, "1970_Percent_Bachelor_Degree_Or_Higher" = education_attainment$`1980_Percent_Bachelor_Degree_Or_Higher`, "1980_Less_Than_High_School_Diploma" = education_attainment$`1980_Less_Than_High_School_Diploma`, "1980_High_School_Diploma_Only" = education_attainment$`1980_High_School_Diploma_Only`, "1980_Some_College" = education_attainment$`1980_Some_College`, "1980_Bachelor_Degree_Or_Higher" = education_attainment$`1980_Bachelor_Degree_Or_Higher`, "1980_Percent_Less_Than_High_School_Diploma" = education_attainment$`1980_Percent_Less_Than_High_School_Diploma`, "1980_Percent_High_School_Diploma_Only" = education_attainment$`1980_Percent_High_School_Diploma_Only`, "1980_Percent_Some_College" = education_attainment$`1980_Percent_Some_College`, "1980_Percent_Bachelor_Degree_Or_Higher" = education_attainment$`1980_Percent_Bachelor_Degree_Or_Higher`, "1990_Less_Than_High_School_Diploma" = education_attainment$`1990_Less_Than_High_School_Diploma`, "1990_High_School_Diploma_Only" = education_attainment$`1990_High_School_Diploma_Only`, "1990_Some_College" = education_attainment$`1990_Some_College`, "1990_Bachelor_Degree_Or_Higher" = education_attainment$`1990_Bachelor_Degree_Or_Higher`, "1990_Percent_Less_Than_High_School_Diploma" = education_attainment$`1990_Percent_Less_Than_High_School_Diploma`, "1990_Percent_High_School_Diploma_Only" = education_attainment$`1990_Percent_High_School_Diploma_Only`, "1990_Percent_Some_College" = education_attainment$`1990_Percent_Some_College`, "1990_Percent_Bachelor_Degree_Or_Higher" = education_attainment$`1990_Percent_Bachelor_Degree_Or_Higher`, "2000_Less_Than_High_School_Diploma" = education_attainment$`2000_Less_Than_High_School_Diploma`, "2000_High_School_Diploma_Only" = education_attainment$`2000_High_School_Diploma_Only`, "2000_Some_College" = education_attainment$`2000_Some_College`, "2000_Bachelor_Degree_Or_Higher" = education_attainment$`2000_Bachelor_Degree_Or_Higher`, "2000_Percent_Less_Than_High_School_Diploma" = education_attainment$`2000_Percent_Less_Than_High_School_Diploma`, "2000_Percent_High_School_Diploma_Only" = education_attainment$`2000_Percent_High_School_Diploma_Only`, "2000_Percent_Some_College" = education_attainment$`2000_Percent_Some_College`, "2000_Percent_Bachelor_Degree_Or_Higher" = education_attainment$`2000_Percent_Bachelor_Degree_Or_Higher`, "2013-17_Less_Than_High_School_Diploma" = education_attainment$`2013-17_Less_Than_High_School_Diploma`, "2013-17_High_School_Diploma_Only" = education_attainment$`2013-17_High_School_Diploma_Only`, "2013-17_Some_College" = education_attainment$`2013-17_Some_College`, "2013-17_Bachelor_Degree_Or_Higher" = education_attainment$`2013-17_Bachelor_Degree_Or_Higher`, "2013-17_Percent_Less_Than_High_School_Diploma" = education_attainment$`2013-17_Percent_Less_Than_High_School_Diploma`, "2013-17_Percent_High_School_Diploma_Only" = education_attainment$`2013-17_Percent_High_School_Diploma_Only`, "2013-17_Percent_Some_College" = education_attainment$`2013-17_Percent_Some_College`, "2013-17_Percent_Bachelor_Degree_Or_Higher" = education_attainment$`2013-17_Percent_Bachelor_Degree_Or_Higher`)


## -----------------------------------------------------------------------------
education$`1970_Less_Than_High_School_Diploma` <- type.convert(education$`1970_Less_Than_High_School_Diploma`)
education$`1970_High_School_Diploma_Only` <- type.convert(education$`1970_High_School_Diploma_Only`)
education$`1970_Some_College` <- type.convert(education$`1970_Some_College`)
education$`1970_Bachelor_Degree_Or_Higher` <- type.convert(education$`1970_Bachelor_Degree_Or_Higher`)
education$`1980_Less_Than_High_School_Diploma` <- type.convert(education$`1980_Less_Than_High_School_Diploma`)
education$`1980_High_School_Diploma_Only` <- type.convert(education$`1980_High_School_Diploma_Only`)
education$`1980_Some_College` <- type.convert(education$`1980_Some_College`)
education$`1980_Bachelor_Degree_Or_Higher` <- type.convert(education$`1980_Bachelor_Degree_Or_Higher`)
education$`1990_Less_Than_High_School_Diploma` <- type.convert(education$`1990_Less_Than_High_School_Diploma`)
education$`1990_High_School_Diploma_Only` <- type.convert(education$`1990_High_School_Diploma_Only`)
education$`1990_Some_College` <- type.convert(education$`1990_Some_College`)
education$`1990_Bachelor_Degree_Or_Higher` <- type.convert(education$`1990_Bachelor_Degree_Or_Higher`)
education$`2000_Less_Than_High_School_Diploma` <- type.convert(education$`2000_Less_Than_High_School_Diploma`)
education$`2000_High_School_Diploma_Only` <- type.convert(education$`2000_High_School_Diploma_Only`)
education$`2000_Some_College` <- type.convert(education$`2000_Some_College`)
education$`2000_Bachelor_Degree_Or_Higher` <- type.convert(education$`2000_Bachelor_Degree_Or_Higher`)
education$`2013-17_Less_Than_High_School_Diploma` <- type.convert(education$`2013-17_Less_Than_High_School_Diploma`)
education$`2013-17_High_School_Diploma_Only` <- type.convert(education$`2013-17_High_School_Diploma_Only`)
education$`2013-17_Some_College` <- type.convert(education$`2013-17_Some_College`)
education$`2013-17_Bachelor_Degree_Or_Higher` <- type.convert(education$`2013-17_Bachelor_Degree_Or_Higher`)


## -----------------------------------------------------------------------------
location$State <- as.factor(location$State)
levels(location$State)

location$`2003_Rural_Urban_Continuum_Code` <- as.factor(location$`2003_Rural_Urban_Continuum_Code`)
levels(location$`2003_Rural_Urban_Continuum_Code`)

location$`2003_Urban_Influence_Code` <- as.factor(location$`2003_Urban_Influence_Code`)
levels(location$`2003_Urban_Influence_Code`)

location$`2013_Rural_Urban_Continuum_Code` <- as.factor(location$`2013_Rural_Urban_Continuum_Code`)
levels(location$`2013_Rural_Urban_Continuum_Code`)

location$`2013_Urban_Influence_Code` <- as.factor(location$`2013_Urban_Influence_Code`)
levels(location$`2013_Urban_Influence_Code`)

education$State <- as.factor(education$State)
levels(education$State)


## -----------------------------------------------------------------------------
#summary for 1970
summary(education$`1970_Less_Than_High_School_Diploma`)
summary(education$`1970_High_School_Diploma_Only`)
summary(education$`1970_Some_College`)
summary(education$`1970_Bachelor_Degree_Or_Higher`)


## -----------------------------------------------------------------------------
#summary for 1980
summary(education$`1980_Less_Than_High_School_Diploma`)
summary(education$`1980_High_School_Diploma_Only`)
summary(education$`1980_Some_College`)
summary(education$`1980_Bachelor_Degree_Or_Higher`)


## -----------------------------------------------------------------------------
summary(education$`1990_Less_Than_High_School_Diploma`)
summary(education$`1990_High_School_Diploma_Only`)
summary(education$`1990_Some_College`)
summary(education$`1990_Bachelor_Degree_Or_Higher`)


## -----------------------------------------------------------------------------
#summary for 2000
summary(education$`2000_Less_Than_High_School_Diploma`)
summary(education$`2000_High_School_Diploma_Only`)
summary(education$`2000_Some_College`)
summary(education$`2000_Bachelor_Degree_Or_Higher`)


## -----------------------------------------------------------------------------
#summary for 2013-17
summary(education$`2013-17_Less_Than_High_School_Diploma`)
summary(education$`2013-17_High_School_Diploma_Only`)
summary(education$`2013-17_Some_College`)
summary(education$`2013-17_Bachelor_Degree_Or_Higher`)


## -----------------------------------------------------------------------------
library("ggplot2")

mean(education$`1970_Less_Than_High_School_Diploma`, na.rm = TRUE)


ggplot(education, aes(State, mean(`1970_Less_Than_High_School_Diploma`, na.rm = TRUE))) + geom_col() + labs( x = "State", y = "Average Number of Students",
title ="Average number of student in 1970 with less than a high school diploma") + 
  theme(axis.text.x = element_text(size = 9, angle=90), axis.text.y = element_text(size=14))

ggplot(education, aes(State, mean(`1980_High_School_Diploma_Only`, na.rm = TRUE))) + geom_col() + labs( x = "State", y = "Average Number of Students",
title ="Average number of student in 1980 with a high school diploma only") + 
  theme(axis.text.x = element_text(size = 9, angle=90), axis.text.y = element_text(size=14))


ggplot(education, aes(State, mean(`1980_Less_Than_High_School_Diploma`, na.rm = TRUE))) + geom_col() + labs( x = "State", y = "Average Number of Students",
title ="Average number of student in 1980 less than a high school diploma") + 
  theme(axis.text.x = element_text(size = 9, angle=90), axis.text.y = element_text(size=14))


ggplot(education, aes(State, mean(`1990_High_School_Diploma_Only`, na.rm = TRUE))) + geom_col() + labs( x = "State", y = "Average Number of Students",
title ="Average number of student in 1990 with a high school diploma only") + 
  theme(axis.text.x = element_text(size = 9, angle=90), axis.text.y = element_text(size=14))


ggplot(education, aes(State, mean(`2000_High_School_Diploma_Only`, na.rm = TRUE))) + geom_col() + labs( x = "State", y = "Average Number of Students",
title ="Average number of student in 2000 with a high school diploma only") + 
  theme(axis.text.x = element_text(size = 9, angle=90), axis.text.y = element_text(size=14))

ggplot(education, aes(State, mean(`2000_Some_College`, na.rm = TRUE))) + geom_col() + 
  labs( x = "State", y = "Average Number of Students",
  title ="Average number of student in 2000 with some college completed") + 
  theme(axis.text.x = element_text(size = 9, angle=90), axis.text.y = element_text(size=14))


ggplot(education, aes(State, mean(`2013-17_Bachelor_Degree_Or_Higher`, na.rm = TRUE))) + geom_col() + 
  labs( x = "State", y = "Average Number of Students", 
  title ="Average number of student in 2013-17 with a bachelor degree or higher") + 
  theme(axis.text.x = element_text(size = 9, angle=90), axis.text.y = element_text(size=14)) + 
  scale_y_continuous()

