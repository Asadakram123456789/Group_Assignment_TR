# Load libraries
library(ggplot2)
library(e1071)

# Load dataset
dataset <- read.csv("data/538ratingsMen.csv")

# Display the first few rows
head(dataset)

# Histogram with density curve overlay
histogram_with_density_curve <- ggplot(dataset, aes(x = X538rating)) +
  geom_histogram(aes(y = ..density..), binwidth = 2, fill = "blue", color = "black", alpha = 0.7) +
  geom_density(color = "red", size = 1) +
  labs(title = "Histogram with Density Curve",
       x = "538rating", y = "Density") +
  theme_minimal()

# Save the histogram with density curve
ggsave("images/histogram_with_density_curve.png", plot = histogram_with_density_curve, width = 8, height = 6)

# Scatterplot with trendline
scatterplot <- ggplot(dataset, aes(x = Season, y = X538rating)) +
  geom_point(color = "blue", alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "red", size = 1) +
  labs(title = "Scatterplot of Season vs. NCAA Ratings",
       x = "Season (Year)",
       y = "538rating") +
  theme_minimal()

# Save the scatterplot
ggsave("images/scatterplot_with_trendline.png", plot = scatterplot, width = 8, height = 6)

# Normality check
shapiro_test_result <- shapiro.test(dataset$X538rating)
print(shapiro_test_result)

# Skewness and kurtosis
skewness_value <- skewness(dataset$X538rating, na.rm = TRUE)
kurtosis_value <- kurtosis(dataset$X538rating, na.rm = TRUE)

print(paste("Skewness:", skewness_value))
print(paste("Kurtosis:", kurtosis_value))
