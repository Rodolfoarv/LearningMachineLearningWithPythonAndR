#Reads the csv file in the current directory
college = read.csv("College.csv")
#Gives the university name to each row, thus ignoring that column for future analysis
rownames (college )=college [,1]
#Remove the university name column since we already have the rownames
college = college[,-1]
fix(college)


summary(college)
pairs(college[,1:10])
plot(college$Outstate, college$private, xlab="outstate", ylab="private")

# Create a new qualitative variable, called Elite, by binning the Top10perc variable. We are going to divide universities
#into two groups based on whether or not the proportion of students coming from the top 10 % of their high school classes exceeds 50 %.

Elite = rep("No", nrow(college))
Elite[college$Top10perc>50] = "Yes"
Elite=as.factor(Elite)
college=data.frame(college, Elite)

summary(college)
plot(college$Elite, college$Outstate, xlab="Elitness", ylab="outstate")
