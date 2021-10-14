
# Initial laboratory session
# GEI - ADEI

# Principal characteristics of R and its programming:

# - Open-source.

# - Highly Active Community. Functions and packages are personal creations from users. 

# - Oriented to objects. 

# - Extremely comprehensive. 

# - It does not need a compiler to run code. 

# - Direction to machine learning. 

# - Compatibility with other Data Processing Technologies (Example: Use a spark cluster to process large datasets using R)

# - R markdown to generate reports in any desired format.

# - Operations directly on vectors, not too much looping.

# - Data from APIs (and many other formats) can be easily pulled down.

### Initial commands and basic descriptive statistics:

# How to citate R?
citation()

## Load package and data:

# install.packages("car")
library(car)
data(Davis)
attributes(Davis)
# Numeric Univariant Description
summary(Davis)
# Rows and columns of data.frame Davis
dim(Davis)

## Graphical Description of numeric data

# Histograms:
par(mfrow=c(2,2))
hist(Davis$weight)
hist(Davis$weight,10)
hist(Davis$weight,col="blue", 10)
hist(Davis$weight,10,col=rainbow(10))

# Histogram with proportions:
par(mfrow=c(1,1))
hist(Davis$weight,freq=F)  # Proportions

# Dotplot:
par(mfrow=c(2,1))
stripchart(Davis$weight,method="stack")
stripchart(Davis$weight,method="stack",xlab="weight",pch=19,col=3,main="Dotplot Weight in Davis dataset")

# Boxplots (two ways of computing):
par(mfrow=c(2,3))
boxplot(Davis$weight)
boxplot(Davis$weight,col="blue",horizontal = TRUE)
boxplot(Davis$weight,col="blue",horizontal = TRUE, pch=19,labels=Davis$weight)

Boxplot(Davis$weight)
Boxplot(Davis$weight,col="blue",main= "Weight in Davis dataset - row name Id")
Boxplot(Davis$weight,col="blue",main=" Boxplot Weight - Weight Label for Outliers",labels=Davis$weight)

# Barplots and pie charts:
par(mfrow=c(2,2))
barplot(table(Davis$sex), ylim = c(0,140))
barplot(table(Davis$sex),col=rainbow(2))
pie(table(Davis$sex))
pie(table(Davis$sex),col=rainbow(2))

# Description of variable factors:
  
table(Davis$sex)
margin.table(table(Davis$sex))
prop.table(table(Davis$sex))

# Ask for information, arguments and outputs of a function:
  
?boxplot

# Other functions:
  
View(Davis)
head(Davis, n = 20) # n = 20 means  that the first 20 lines are printed in the R console

attach(Davis)
summary(weight)
detach(Davis)
summary(weight) # Do not work

with(Davis,tapply(height,sex,summary))
summary(Davis$height)
par(mfrow=c(1,1))
with(Davis,Boxplot(height~sex,pch=19,col=rainbow(2),main="Height vs Sex"))


### Set directory and load libraries to work with used cars data:

setwd("D:/Docencia_UPC/GEI-ADEI/Lab 0") #Set working directory
# setwd("C:/Users/lmontero/Dropbox/DOCENCIA/FIB-ADEI/PRACTICA/CarPrices/LABS")
install.packages(c("car", "FactoMineR", "knitr"))
library(car)
library(FactoMineR)
library(knitr)

## Load Data and Select Sample

# Lecture of DataFrames:
df1 <- read.table("audi.csv",header=T, sep=",")
df1$manufacturer <- "Audi"
df2 <- read.table("bmw.csv",header=T, sep=",")
df2$manufacturer <- "BMW"
df3 <- read.table("merc.csv",header=T, sep=",")
df3$manufacturer <- "Mercedes"
df4 <- read.table("vw.csv",header=T, sep=",")
df4$manufacturer <- "VW"

# Union by row:
df <- rbind(df1,df2,df3,df4)
dim(df)  # Size of data.frame
str(df) # Object class and description
names(df) # List of variable names

# Use birthday of 1 member of the group
set.seed(12345)

# Random selection of x registers:
sam<-as.vector(sort(sample(1:nrow(df),1000)))
head(df)  # Take a look to the first rows/instances
df<-df[sam,]  # Subset of rows _ My sample
summary(df)

# Keep information in an .Rdata file:
save(list=c("df"),file="MyOldCars-Raw.RData")

