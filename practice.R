accidents<-read.csv("Accidents0515.csv",header=TRUE,stringsAsFactors=FALSE)

df<-accidents

df$Date<-dmy(df$Date)

df<-df%>%
  filter(Date<="2005-12-31")%>%
  select(Day_of_Week)

df$Day_of_Week<-factor(df$Day_of_Week,levels=c("1","2","3","4","5","6","7"))

#Histogram

#Run commands above
  
ggplot()+
  geom_histogram(data=df,aes(x=Day_of_Week),stat="count",binwidth=0.5)+
  ggtitle("Chart C")+            
  xlab("Weekday")+
  ylab("Number of Accidents")

#2005 time series 

#Run Rows 3 and 5 first

df<-df%>%
  group_by(Date)%>%
  summarize(num_accidents=n())%>%
  filter(Date<="2005-12-31")%>%
  select(Date,num_accidents)

ggplot()+
  geom_line(data=df,aes(x=Date,y=num_accidents))+
  ggtitle("Daily Number of Accidents 2005")+            
  xlab("Date")+
  ylab("Number of Accidents")
  
#Dec 2005 time series 

#Run Rows 3 and 5 first

df<-df%>%
  group_by(Date)%>%
  summarize(num_accidents=n())%>%
  filter(Date>="2005-12-01"& Date<="2005-12-31")%>%
  select(Date,num_accidents)
  
ggplot()+
  geom_line(data=df,aes(x=Date,y=num_accidents))+
  ggtitle("Daily Number of Accidents December 2005")+            
  xlab("Date")+
  ylab("Number of Accidents")  




  