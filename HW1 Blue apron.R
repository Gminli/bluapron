library(caret) # for confusion matrix, RMSE
library(pROC) # for ROC curves
df=read.csv("D2.3 Blue apron.csv")

str(df)

set.seed(123)  
idx = sample(2,nrow(df),replace=TRUE,prob=c(.7,.3))  
table(idx)  
#--to set the environment and result consistent

#1a
##logistic model 1 CLV
gm1 = glm(churn~tenure+rating+partysize+urban+menu+frequency,family=binomial,data=df[idx==1,])
gm1prob = predict(gm1,newdata=df,type="response")
summary(gm1)
##logistic model 2 CLV
gm2 = glm(churn~tenure+rating+partysize+urban+menu+frequency+rating*partysize+rating*urban+partysize*urban+urban*tenure,family=binomial,data=df[idx==1,])
gm2prob = predict(gm2,newdata=df,type="response")
summary(gm2)

#1b
roc(df$churn[idx==2]~gm1prob[idx==2], plot = TRUE, print.auc = TRUE)  
roc(df$churn[idx==2]~gm2prob[idx==2], plot = TRUE, print.auc = TRUE)  

##specification2 has higher AUC

#1c
gm = glm(churn~tenure+rating+partysize+urban+menu+frequency+rating*partysize+rating*urban+partysize*urban+urban*tenure,family=binomial,data=df)
gmprob = predict(gm,newdata=df,type="response")
hist(gmprob,main="Histogram of Churn Probabilities")


#2a (outcome MonthlyAddons)
# linear model 1 
lm1 <- glm(monthlyaddons ~ tenure+rating+partysize+urban+menu+frequency,family="gaussian",data=df[idx==1,])  
lm1_pred = predict(lm1,newdata=df)
hist(lm1_pred)
##linear model 2
lm2 = glm(monthlyaddons~tenure+rating+partysize+urban+menu+frequency+rating*partysize+rating*urban+partysize*urban+urban*tenure,family="gaussian",data=df[idx==1,])
lm2_pred = predict(lm2,newdata=df)
hist(lm2_pred)
#2b
lm1_metrics = postResample(pred = lm1_pred[idx==2], obs = df$monthlyaddons[idx==2])
lm1_metrics
lm2_metrics = postResample(pred = lm2_pred[idx==2], obs = df$monthlyaddons[idx==2])
lm2_metrics

##specification2 has lower RMSE. We will use it.

#2c
lm = glm(monthlyaddons~tenure+rating+partysize+urban+menu+frequency+rating*partysize+rating*urban+partysize*urban+urban*tenure,family="gaussian",data=df)
lm_pred = predict(lm,newdata=df)
hist(lm_pred,main="Histogram of Monthly Addons")
##yes numbers are within the range
df$predicted_churn_prob = gmprob
df$predicted_monthlyaddons = lm_pred

#3
write.csv(df,file = "HW1 Blue apron.csv")

#4a
##calculate monthly net contribution
df$MonthlyNetContribution = (df$monthlybasepayment + df$predicted_monthlyaddons)*0.3
df$retention_rates = 1 - df$predicted_churn_prob
hist(df$retention_rates)
##calculate baseline CLV without new policy
df$CLV_base = df$MonthlyNetContribution*1/(1 - df$retention_rates*0.98)

#4b
df$retention_rates_new = ifelse((df$retention_rates + 0.01) > 1,1,(df$retention_rates + 0.01))
df$CLV_newpolicy = df$MonthlyNetContribution*1/(1 - df$retention_rates_new*0.98) - 20
df$if_target = ifelse(df$CLV_new > 0 & df$CLV_new > df$CLV_base,1,0)
sum(df$if_target)

#4c
df$newpolicy_CLV = ifelse(df$if_target == 1, df$CLV_new, df$CLV_base)
sum(df$newpolicy_CLV) - sum(df$CLV_base)

