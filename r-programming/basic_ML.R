# Load data 
mtcars

# Split data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size=0.7*n)
train_df <- mtcars[id, ]
test_df <- mtcars[-id, ]

# Train model
lm_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "lm")

knn_model <- train(mpg ~ hp + wt + am,
                   data = train_df,
                   method = "knn")

# Score
p_test <- predict(lm_model, newdata = test_df)

p_knn_test <- predict(knn_model, newdata = test_df)

# Evaluate
error <- test_df$mpg - p_test
mae <- mean(abs(error))
mse <- mean(error**2)
rmse <- sqrt(mse)

error_knn <- test_df$mpg - p_knn_test
mae_knn <- mean(abs(error_knn))
mse_knn <- mean(error_knn**2)
rmse_knn <- sqrt(mse_knn)
