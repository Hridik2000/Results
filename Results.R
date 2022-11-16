library(ggplot2)
df <- read.csv(url("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv"))
df
z <- ggplot(data = df, aes(x = Hours,y = Scores)) + geom_point()
z + labs(title = "Hours vs Scores")
# we can see that there is a positive relationship between number of hours a student 
# studies and the scores they receive in exam.
z + geom_smooth(method = 'lm', se = FALSE)
# Model for predicting the number of hours studied.
model<- lm(formula = Hours ~ Scores, data = df)
summary(model)
model$fitted.values
df$predicted <- model$fitted.values
View(df)
# Plotting the actual number of hours with the predicted number of hours
a<- ggplot(data = df, aes(x = Hours,y= predicted)) + geom_point() + geom_smooth(method = 'lm', se = FALSE)
a + labs(title = 'Actual_Hours vs Predicted_hours')
