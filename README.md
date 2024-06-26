## Preprint

# Healthspan definition
Number of years from birth without a major chronic medical condition, including cancer (excluding non-melanoma skin cancer), diabetes (type I diabetes, type II diabetes, and malnutrition-related diabetes), heart failure, myocardial infarction (MI), stroke, chronic obstructive pulmonary disease (COPD), dementia, or death

## Setup
Users are required to download and install R but no R package is needed to calculate the healthspan proteomic score (HPS).

## Example
The R code below shows you how to load the "HPS" function in "HPS.R" to calculate healthspan proteomic scores for five subjects with input data in "hps_example_data.csv".

source("HPS.R")
hps_input=read.csv("hps_example_data.csv")
HPS(hps_input)

