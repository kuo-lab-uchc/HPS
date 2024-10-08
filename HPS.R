# HPS: This function is used to calculate the healthspan proteomic score.

HPS <- function(data){
  
  shape=0.064438847 # shape from the Gompertz model with age and 86 proteins selected by a LASSO Cox regression model for ending healthspan
  rate=0.002104934 # rate from the Gompertz model with age and 86 proteins selected by a LASSO Cox regression model for ending healthspan
  
  # age and 86 proteins to calculate the HPS
  predictors=c("age","ace2","adgrg1","adgrg2","ager","alpp","areg","art3","baiap2","bcan","c7",
               "ca14","ccl21","cd302","cd80","cdcp1","cdh2","ceacam5","celsr2","chad","cpa2",
               "cptp","creld1","crh","cst5","cthrc1","cxcl17","ddc","dsg4","egfr","erc2",
               "faslg","fgfbp1","gast","gdf15","gp2","gzma","havcr1","hdac9","hgf","icoslg",
               "igfbp7","igsf3","il18r1","il7r","inhbb","itga2","kiaa0319","kitlg","klk3","klk4",
               "lmnb2","lpa","ltbp2","mepe","met","mmp12","mxra8","nefl","nell2","nos2",
               "nppb","ntprobnp","odam","pigr","plaur","pon3","prdx6","prg3","ptn","rbfox3",
               "scg2","scgb1a1","sez6l","shbg","sit1","tacstd2","timd4","tnfrsf10b","tnfrsf13b", 
               "tnfrsf6b","tnr","tyrp1","umod","vgf","vsig2","wfdc2")  
  
  # Gompertz coefficients associated with age and 86 proteins in "predictors"
  betas=c(0.032048614, 0.015593936, 0.024076231, -0.040421812,
                     -0.116743915, 0.012210639, 0.118030146, -0.144364185,
                     0.039456867, -0.036663963, 0.076494332, -0.096113561,
                     0.04317575, 0.057492305, 0.086554797, 0.028595709,
                     0.047634722, 0.052992061, -0.140593054, -0.044368174,
                     -0.017718394, -0.10447141, 0.050287205, -0.012944364,
                     -0.07214694, 0.061939194, -0.024118167, -0.062662059,
                     -0.039547894, 0.016914418, -0.040959587, -0.07000969,
                     -0.080842544, 0.013003506, 0.070410303, 0.059401682,
                     -0.151618894, 0.109591476, -0.047163506, -0.007618292,
                     -0.111276039, 0.113323593, 0.099365702, 0.02128643, 
                     -0.01853799, 0.046951064, -0.040459949, -0.08993137,
                     -0.02186897, 0.107662356, 0.037915351, 0.105679812,
                     0.022824782, 0.17458179, -0.104051099, -0.235794747,
                     0.111635613, -0.136286061, 0.163020547, -0.110676076,
                     -0.081304262, 0.026246828, 0.061087686, -0.035680338,
                     0.027406752, 0.092377466, 0.010509645, -0.042081132,
                     -0.064926112, 0.053608927, 0.042662634, -0.099228114,
                     -0.080621372, -0.021262697, -0.094739623, 0.032371644,
                     -0.097248981, 0.064176978, 0.058214552, 0.129833115,
                     0.014330515, -0.109778897, 0.071909539, -0.026824116,
                     -0.071788442, 0.02497625, 0.130022478) 
  colnames(data) <- tolower(colnames(data)) # convert column names of the data to lowercase
  data <- data[,which(colnames(data)%in%predictors)] # keep predictors only in the data
  if(sum(!predictors%in%colnames(data))==0){
    
   # match the variable names in "predictors" and the input data
  betas=betas[match(colnames(data), predictors)]
  
  # b(x)=b*exp(x*beta)
  b_x <- as.matrix(data)%*%as.matrix(betas)
  rate_new <- rate*exp(b_x)
  
  # 10-year risk of ending healthspan 
  cdf_10_year=1-exp(-(rate_new/shape)*(exp(shape*10)-1))
  
  # healthspan proteomic score
  hps=1-cdf_10_year
  colnames(hps) <- "HPS"
  return(hps)
  }else{  
    cat("Missing predictors:\n",predictors[which(!predictors%in%colnames(data))])
  }
}
