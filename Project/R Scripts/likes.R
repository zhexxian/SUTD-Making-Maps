library(data.table)
library(bit64)

likes <- fread("C:/Users/Zhexian/Desktop/combined_data.csv",header = T, fill = T)
#sort data
likes <- likes[order(id,num_of_likes)]

#find the interval
likes[,likes := c(num_of_likes),by = id]
meanlikes <-likes[,list(meanlikes =mean(likes)),by = id]
medianlikes <-likes[,list(medianlikes =median(likes)),by = id]
write.csv(meanlikes,file = "combined_mean_likes.csv")
write.csv(medianlikes,file = "combined_median_likes.csv")