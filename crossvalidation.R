#create my crossvalidation predictors
pred1 <- predict(modelFit$finalModel,crossval1[,-length(crossval1)])
pred2 <- predict(modelFit$finalModel,crossval2[,-length(crossval2)])
pred3 <- predict(modelFit$finalModel,crossval3[,-length(crossval3)])
pred4 <- predict(modelFit$finalModel,crossval4[,-length(crossval4)])