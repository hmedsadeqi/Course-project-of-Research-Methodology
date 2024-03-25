# Clear workplace
rm(list = ls())

# Load libraries
library(dplyr)
library(ggplot2)

# Set working directory
getwd()
setwd('D:/Projects/Research Method Course Project/Data and Code')

path_report <- "D:\\Projects\\Research Method Course Project\\Report"
path_Tables <- "D:\\Projects\\Research Method Course Project\\Tables and Graphs"

# Create directories if they don't exist
if (!file.exists(path_report)) {
  dir.create(path_report, recursive = TRUE)
}

if (!file.exists(path_Tables)) {
  dir.create(path_Tables, recursive = TRUE)
}

# Read data
data <- read.csv("CN95.csv")

# Convert Weight_individual to numeric
data$Weight_individual <- as.numeric(as.character(data$Weight_individual))

# Create MaritalStatus variable
data$MaritalStatus <- ifelse(data$MarriageStatus == 4, 0, 1)

# Create State variable
data$State <- ifelse(data$ActivityType == 1, "Employed",
                     ifelse(data$ActivityType == 5, "Currently Educating", "House Keeper"))

# Create data1
data1 <- data[, c("KhanevarID", "State", "MaritalStatus", "ur", "Weight_individual")]

# Aggregate data
prop_data <- data1 %>%
  group_by(State, ur) %>%
  summarise(Weight_sum = sum(Weight_individual),
            Married_sum = sum(MaritalStatus * Weight_individual)) %>%
  mutate(percentage = Married_sum / Weight_sum * 100,
         ur = ifelse(ur == 1, "urban", "rural"))

# Plot
ggplot(prop_data, aes(x = State, y = percentage, fill = ur)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  scale_fill_brewer(palette = "Paired") +
  labs(title = "Proportion by Category and Location",
       x = "Category", y = "Proportion of Married Women")

ggsave("path_Tables/Proportion_Married_Women.png", plot, dpi = 300)

# calculating odds : 
# group the data by category and calculate the proportion of married women
odds_data <- aggregate(Weight_individual*MaritalStatus ~ State , data = data1 , FUN = mean)

# calculate the odds of being a married woman for each category
odds_data$Odds <- odds_data$`Weight_individual * MaritalStatus` / (1 - odds_data$`Weight_individual * MaritalStatus`)


# calculating odds ratio of being a married woman for each category
odds_ratio1 <- odds_data[1,3] / odds_data[2,3]
odds_ratio2 <- odds_data[1,3] / odds_data[3,3]
odds_ratio3 <- odds_data[2,3] / odds_data[3,3]

# display the results
cat("Odds ratio for Employed vs House Keeper:", odds_ratio3, "\n")
cat("Odds ratio for Employed vs Currently Educating:", odds_ratio1, "\n")
cat("Odds ratio for House Keeper vs Currently Educating:", odds_ratio2, "\n")


data$years_of_education <- ifelse(data$EducationEvidence == 1 , 5 , 
                                  ifelse(data$EducationEvidence == 2 , 8 , 
                                         ifelse(data$EducationEvidence == 3 , 11 , 
                                                ifelse(data$EducationEvidence == 4 , 12 , 
                                                       ifelse(data$EducationEvidence == 5 , 14 , 
                                                              ifelse(data$EducationEvidence == 6 , 16 , 
                                                                     ifelse(data$EducationEvidence == 7 , 18 , 
                                                                            ifelse(data$EducationEvidence == 8 , 23 , 
                                                                                   ifelse(data$EducationEvidence == 15 , 0 , NA)))))))))


# Calculate household size
data <- data %>%
  mutate(ones = 1) %>%
  group_by(KhanevarID) %>%
  summarise(household_size = sum(ones)) %>%
  right_join(data, by = "KhanevarID")

# Separate urban and rural data
urban_data <- filter(data, ur == 1)
rural_data <- filter(data, ur == 2)

# Fit logistic regression models
logit_urban <- glm(MaritalStatus ~ years_of_education + household_size, weights = Weight_individual,
                   family = binomial(link = "logit"), data = urban_data)
logit_rural <- glm(MaritalStatus ~ years_of_education + household_size, weights = Weight_individual,
                   family = binomial(link = "logit"), data = rural_data)

# Summarize the logistic regression
summary(logit_urban)
summary(logit_rural)

# Calculate the average odds of being married for each state category within the urban data
odds_data <- aggregate(Weight_individual*MaritalStatus ~ State , data = urban_data , FUN = mean)

# calculate the odds of being a married woman for each category
odds_data$Odds <- odds_data$`Weight_individual * MaritalStatus` / (1 - odds_data$`Weight_individual * MaritalStatus`)

# display the results
odds_data


odds_ratio1 <- odds_data[1,3] / odds_data[2,3]
odds_ratio2 <- odds_data[1,3] / odds_data[3,3]
odds_ratio3 <- odds_data[2,3] / odds_data[3,3]

cat("Odds ratio for Employed vs House Keeper:", odds_ratio3, "\n")
cat("Odds ratio for Employed vs Currently Educating:", odds_ratio1, "\n")
cat("Odds ratio for House Keeper vs Currently Educating:", odds_ratio2, "\n")

# Calculate the average odds of being married for each state category within the rural data
odds_data <- aggregate(Weight_individual*MaritalStatus ~ State , data = rural_data , FUN = mean)

# calculate the odds of being a married woman for each category
odds_data$Odds <- odds_data$`Weight_individual * MaritalStatus` / (1 - odds_data$`Weight_individual * MaritalStatus`)

# display the results
odds_data

odds_ratio1 <- odds_data[1,3] / odds_data[2,3]
odds_ratio2 <- odds_data[1,3] / odds_data[3,3]
odds_ratio3 <- odds_data[2,3] / odds_data[3,3]

cat("Odds ratio for Employed vs House Keeper:", odds_ratio3, "\n")
cat("Odds ratio for Employed vs Currently Educating:", odds_ratio1, "\n")
cat("Odds ratio for House Keeper vs Currently Educating:", odds_ratio2, "\n")


# Fit logistic regression model for urban data with logit link function
logit_urban <- glm(MaritalStatus ~ years_of_education + household_size, 
                      weights = Weight_individual,
                      family = binomial(link = "logit"),
                      data = urban_data)

# Fit logistic regression model for rural data with complementary log-log link function
log_log_rural <- glm(MaritalStatus ~ years_of_education + household_size, 
                      weights = Weight_individual,
                      family = binomial(link = "cloglog"),
                      data = rural_data)

# Display summary of the logistic regression model for urban data
summary(logit_urban)
summary(log_log_rural)

# Fit logistic regression model for rural data with logit link function
logit_rural <- glm(MaritalStatus ~ years_of_education + household_size, 
                      weights = Weight_individual,
                      family = binomial(link = "logit"),
                      data = rural_data)

# Display summary of the logistic regression model for rural data
summary(logit_rural)


# Predict probabilities for urban and rural data using logistic regression models
urban_data$predicted_prob <- predict(logit_urban, newdata = urban_data, type = "response")
rural_data$predicted_prob <- predict(logit_rural, newdata = rural_data, type = "response")

# Calculate marginal effects for years_of_education and household_size for urban data
urban_data$mem_years_of_education <- coef(logit_urban)[2] * mean(urban_data$years_of_education) * (1 - mean(urban_data$predicted_prob)) * sd(urban_data$years_of_education)
urban_data$mem_household_size <- coef(logit_urban)[3] * mean(urban_data$household_size) * (1 - mean(urban_data$predicted_prob)) * sd(urban_data$household_size)

# Calculate marginal effects for logistic regression model
margins(logit_urban, type = "response")


# Calculate marginal effects for years_of_education and household_size for rural data
rural_data$mem_years_of_education <- coef(logit_rural)[2] * mean(rural_data$years_of_education) * (1 - mean(rural_data$predicted_prob)) * sd(rural_data$years_of_education)
rural_data$mem_household_size <- coef(logit_rural)[3] * mean(rural_data$household_size) * (1 - mean(rural_data$predicted_prob)) * sd(rural_data$household_size)

# Calculate marginal effects for logistic regression model
margins(logit_rural, type = "response")



# Fit probit regression models for urban and rural data
probit_urban <- glm(MaritalStatus ~ years_of_education + household_size, data = urban_data, family = binomial(link = "probit"))
probit_rural <- glm(MaritalStatus ~ years_of_education + household_size, data = rural_data, family = binomial(link = "probit"))


summary(probit_urban)
summary(probit_rural)

# Clean the column of employed 
data$employed <- ifelse(data$ActivityType == 1 , 1 , 0)

# Fit logistic regression model
model <- glm(employed ~ age + years_of_education + ur + BirthLiveChild_365Past + ur*BirthLiveChild_365Past,
             data = data, family = binomial(link = "logit"))

# View model summary
summary(model)
