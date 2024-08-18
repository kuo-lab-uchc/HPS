## Preprint

# Healthspan definition
We defined healthspan as the number of years from birth without a major chronic medical condition, including cancer (excluding non-melanoma skin cancer), diabetes (type I diabetes, type II diabetes, and malnutrition-related diabetes), heart failure, myocardial infarction (MI), stroke, chronic obstructive pulmonary disease (COPD), dementia, or death.

## Setup
Users are required to download and install R but no R package is needed to calculate the healthspan proteomic score (HPS).

## Input file
The input file, as shown in hps_example_data.csv, should have the first column designated as the ID column, with any arbitrary column name. This should be followed by columns containing the required proteins. The input file may include additional proteins beyond those needed, and the protein names will be converted to lowercase by the R code.

## Example
The R code below shows you how to load the "HPS" function in "HPS.R" to calculate healthspan proteomic scores for five subjects with input data in "hps_example_data.csv".
```
source("HPS.R")
hps_input=read.csv("hps_example_data.csv")
HPS(hps_input)
```
