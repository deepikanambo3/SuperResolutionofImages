########################
### Cross Validation ###
########################

### Project 3

cv.function <- function(X.train, y.train, par, K, file_names){
  
  n <- dim(y.train)[1]
  n.fold <- floor(n/K)
  s <- sample(rep(1:K, c(rep(n.fold, K-1), n-(K-1)*n.fold)))  
  cv.error <- rep(NA, K)
  
  for (i in 1:K){
    train.data <- X.train[s != i, ,]
    train.label <- y.train[s != i, ,]
    test.data <- X.train[s == i, ,]
    test.label <- y.train[s == i, ,]
    
    fit <- train(train.data, train.label, par)
    pred <- test(fit, test.data)
    cv.error[i] <- mean((pred - test.label)^2)  
    
  }			
  return(c(mean(cv.error), sd(cv.error)))
}
