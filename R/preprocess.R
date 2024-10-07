
data <- read.csv("/Users/fusei/Desktop/24FALL/PHP2550/Project1/project1.csv")
str(data)
dim(data) ## 11564 x 14
## rename
colnames(data) <- c("Race","Year","Sex","Flag","Age","Percent_off","Td","Tw","rh","Tg","SR",
                    "DP", "Wind", "WBGT")

## first check
first.check <- function(var){
    if(class(data[[var]]) == "integer" ||class(data[[var]]) == "numeric"){
        print(range(data[[var]],na.rm = T))
        print(any(is.na(data[[var]])))
        
    }else{
        print(unique(data[[var]]))
    }
}
first.check("Race")
first.check("Year")
first.check("Sex")
first.check("Flag") ## NA exits
first.check("Age")
first.check("Percent off")
first.check("Td") ##NA
first.check("Tw") ##NA negative values
first.check("rh") ##NA
first.check("Tg") ## NA
first.check("SR")## NA
first.check("DP") ##NA negative
first.check("Wind")## NA
first.check("WBGT")## NA

# miss.data <- data[data$Flag == "",]
# table(miss.data$Race, by = c(miss.data$Year))
# ##
# all(which(data$Flag == "") == which(is.na(data$Td)))
# sum(is.na(data$Td)) ## 491
# data <- data[complete.cases(data),]
# dim(data) ## 11073 x 14
# table(data$Race, by = data$Year)
data$Race <- factor(data$Race, levels = 0:4)
data$Year <- factor(data$Year, levels = 1993:2016)
data$Sex <-factor(data$Sex, levels = c(0,1))
data$Flag <- factor(data$Flag, levels = c("White","Green", "Yellow","Red","Black"))

## save
saveRDS(data,"/Users/fusei/Desktop/24FALL/PHP2550/Project1/project1.cleaned_data.rds")
