## Healthspan Proteomic Score (HPS)

## Preprint
A proteomic signature of healthspan
Chia-Ling Kuo, Peiran Liu, Gabin Drouard, Eero Vuoksimaa, Jaakko Kaprio, Miina Ollikainen, Zhiduo Chen, Luke C. Pilling, Janice L. Atkins, Richard H. Fortinsky, George A. Kuchel, Breno S. Diniz
medRxiv 2024.06.26.24309530; doi: https://doi.org/10.1101/2024.06.26.24309530

We developed a proteomics-based signature of healthspan (healthspan proteomic score (HPS)) using data from the UK Biobank Pharma Proteomics Project (53,018 individuals and 2920 proteins). In line with previous studies, we defined healthspan as the number of years from birth without a major chronic medical condition, including cancer (excluding non-melanoma skin cancer), diabetes (type I diabetes, type II diabetes, and malnutrition-related diabetes), heart failure, myocardial infarction (MI), stroke, chronic obstructive pulmonary disease (COPD), dementia, or death. Our findings demonstrate the validity of HPS, making it a valuable tool for assessing healthspan and as a potential surrogate marker in geroscience-guided studies.

## Setup
Users are required to download and install R but no R package is needed to calculate the healthspan proteomic score (HPS).

## Input file
The input file, as shown in "hps_example_data.csv", should have the first column designated as the ID column, with any arbitrary column name. This should be followed by columns containing age and the required proteins. The input file may include additional proteins beyond those needed, and the protein column names will be converted to lowercase.

## Example
The R code below shows you how to load the "HPS" function in "HPS.R" to calculate healthspan proteomic scores for five subjects with input data in "hps_example_data.csv".
```
source("HPS.R")
hps_input=read.csv("hps_example_data.csv")
HPS(hps_input)
```
