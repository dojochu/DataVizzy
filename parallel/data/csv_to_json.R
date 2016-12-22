setwd("C:/Users/skao/Documents/DataVizzy/parallel/data/")
filename <- "crime.csv"

load.data <- read.csv(filename)
head(load.data)

colnames(load.data)[1] <- "name"
load.data$group <- paste(substr(load.data$name,1,3), "0\'s", sep="")
load.data <- as.data.frame(sapply(load.data, FUN=remove.poop))

cat("var foods = [", file= "crime.js",sep="",append=FALSE)
ii=1
for(ii in 1:nrow(load.data)){
	if(ii != 1){
	cat(",{", file="crime.js",append=TRUE,sep="")
	}
	else{
		cat("{", file="crime.js",append=TRUE,sep="")
	}
	cat(paste("\"name\"", ":\"", load.data$name[ii], "\",","\"group\"",":\"",load.data$group[ii],"\",", sep=""), file="crime.js",append=TRUE,sep="" )
	#write(paste("\\"name\\":""", load.data[ii,1],"\\",\\"group\\":\\"",load.data[ii,2],"\\"" ,"crime.js", sep="", append=TRUE)
	for(jj in 2:(ncol(load.data)-1)){
			if(jj != (ncol(load.data)-1)){
			cat(paste("\"", colnames(load.data)[jj], "\":", load.data[ii,jj],",",sep=""), file="crime.js", sep="",append=TRUE)
			}
			else{
				cat(paste("\"", colnames(load.data)[jj], "\":", load.data[ii,jj],sep=""), file="crime.js", sep="",append=TRUE)
			}
		
	}
	cat("}", file="crime.js",sep="", append=TRUE)
}
cat("];", file= "crime.js",sep="",append=TRUE)
