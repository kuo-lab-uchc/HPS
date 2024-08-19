## Preprint
Kuo CL, Liu P, Chen Z, Pilling LC, Atkins JL, Fortinsky RH, Kuchel GA, Diniz BS. A proteomic signature of healthspan. medRxiv [Preprint]. 2024 Jun 26:2024.06.26.24309530. doi: 10.1101/2024.06.26.24309530. PMID: 38978645; PMCID: PMC11230312.

We developed a proteomics-based signature of healthspan (healthspan proteomic score (HPS)) using data from the UK Biobank Pharma Proteomics Project (53,018 individuals and 2920 proteins). In line with previous studies, we defined healthspan as the number of years from birth without a major chronic medical condition, including cancer (excluding non-melanoma skin cancer), diabetes (type I diabetes, type II diabetes, and malnutrition-related diabetes), heart failure, myocardial infarction (MI), stroke, chronic obstructive pulmonary disease (COPD), dementia, or death. Our findings demonstrate the validity of HPS, making it a valuable tool for assessing healthspan and as a potential surrogate marker in geroscience-guided studies.

## Setup
Users are required to download and install R but no R package is needed to calculate the healthspan proteomic score (HPS).

## Input file
The input file, as shown in "hps_example_data.csv", should have the first column designated as the ID column, with any arbitrary column name. This should be followed by columns containing age and the required proteins. The input file may include additional proteins beyond those needed, and the protein column names will be converted to lowercase by the R code "HPS.R".

## Example
The R code below shows you how to load the "HPS" function in "HPS.R" to calculate healthspan proteomic scores for five subjects with input data in "hps_example_data.csv".
```
source("HPS.R")
hps_input=read.csv("hps_example_data.csv")
HPS(hps_input)
```
