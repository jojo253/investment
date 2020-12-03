data=rbind(
  read.csv('D:/GitHub/investment/code/data/TRD_Dalyr.csv')[c(-1,-2),],
  read.csv('D:/GitHub/investment/code/data/TRD_Dalyr1.csv')[c(-1,-2),],
  read.csv('D:/GitHub/investment/code/data/TRD_Dalyr2.csv')[c(-1,-2),],
  read.csv('D:/GitHub/investment/code/data/TRD_Dalyr3.csv')[c(-1,-2),]
)
data$Stkcd=as.numeric(data$Stkcd)
data$Trddt=as.Date(data$Trddt)
data$Dsmvosd=as.numeric(data$Dsmvosd)
data$Dretwd=as.numeric(data$Dretwd)

stock_id=sample(data$Stkcd,1)

data_selected=data[data$Stkcd==stock_id,]

myhist=hist(data_selected$Dretwd)

multiplier <- myhist$counts / myhist$density
mydensity <- density(data_selected$Dretwd)
mydensity$y <- mydensity$y * multiplier[1]