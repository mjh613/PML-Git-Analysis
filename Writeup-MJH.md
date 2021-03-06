Analysis of the Practical machine learning project data
========================================================

### How I built the model
1. Created 4 crossvalidation samples (10% each) from the training set.
2. Then created a working training set from the samples that did NOT contain any of the data in the cross-validation samples.
3. I removed all columns that were characters or had no variance by using a logical "for" loop that looked for the column type, and then later looked for columns where the variance was 'na'.


```r
#clean the data by finding useless columns
# keep = rep(0,times=length(train))
# for(i in 1:length(train)) {
#   if (typeof(train[,i]) == "character") #throws out "character" columns
#       keep[i] = FALSE
#   else keep[i] = TRUE
#   if (is.na(var(train[,i])) == TRUE) #throws out columns that have no variance
#       keep[i] = FALSE
#   else keep[i] = TRUE
# }
# keep[1:5] <- 0 #throws out the X, timestamp columns
# keep[length(keep)] <- 1 #so that it keeps the predictor variable classe
```

4. I ran a "random forests" model to find the best model fit using the randomForests() formula.


```r
#modelFit2 <- randomForest(trainnumm$"classe"~.,data=trainnumm[-length(trainnumm)],importance=TRUE,keep.forest=TRUE)
```

5. Once the model completed, I ran a 


```r
# > importance(modelFit2)
#                              A        B        C        D        E
# num_window           33.733595 45.74668 52.80299 41.17389 40.30983
# roll_belt            35.990861 44.01106 39.65452 43.94712 38.30274
# pitch_belt           30.136259 43.77862 35.94584 32.06904 31.12186
# yaw_belt             38.435115 38.96340 37.00784 43.31057 31.54967
# total_accel_belt     13.039888 17.55054 15.73602 15.74112 16.12401
# gyros_belt_x         15.905629 14.82617 18.75544 12.71914 16.10399
# gyros_belt_y         11.520354 16.36061 14.56262 16.42500 18.58619
# gyros_belt_z         20.081520 24.95691 22.99391 21.77234 22.86493
# accel_belt_x         14.613046 19.05509 16.58020 14.96592 14.55856
# accel_belt_y         11.615594 15.30151 12.90203 15.43560 12.95661
# accel_belt_z         21.040911 24.71127 24.14568 23.29246 19.41439
# magnet_belt_x        15.958204 25.64366 23.67107 21.41092 24.30686
# magnet_belt_y        20.456389 24.01425 23.77493 26.08715 22.16702
# magnet_belt_z        19.905662 23.58654 22.30312 28.17180 22.31851
# roll_arm             20.758551 28.67903 24.50564 27.08367 20.13127
# pitch_arm            14.935829 23.07451 20.63564 19.98940 17.27661
# yaw_arm              17.336846 22.94002 20.04111 24.16585 18.15991
# total_accel_arm       8.956709 21.77656 18.20761 18.23185 18.67682
# gyros_arm_x          15.227745 24.18783 20.79685 22.14739 19.80876
# gyros_arm_y          15.969012 24.53107 20.93853 22.28411 20.23707
# gyros_arm_z          11.112221 15.03109 12.82704 13.58999 12.82232
# accel_arm_x          15.617877 17.46475 17.63694 19.05205 15.23274
# accel_arm_y          16.136306 21.82307 17.58546 16.22585 15.99737
# accel_arm_z          11.861018 19.22232 19.77426 20.79142 17.75858
# magnet_arm_x         16.021752 16.20182 18.67030 18.23433 15.44142
# magnet_arm_y         12.593447 16.21847 17.66675 19.42063 13.83846
# magnet_arm_z         18.278656 20.66206 20.73530 19.31716 17.91965
# roll_dumbbell        21.862245 27.36452 28.04947 27.65671 26.83652
# pitch_dumbbell       10.836042 18.21399 16.29956 13.34244 14.35843
# yaw_dumbbell         17.190101 23.20129 21.42523 20.14527 22.39326
# total_accel_dumbbell 18.208062 22.65137 19.59191 21.49900 23.34957
# gyros_dumbbell_x     14.350512 22.93579 21.63401 19.40311 17.99014
# gyros_dumbbell_y     17.326741 19.34512 24.37243 19.17538 15.94848
# gyros_dumbbell_z     16.221494 20.74842 17.08519 18.65224 15.31153
# accel_dumbbell_x     16.024528 22.24369 19.90682 18.73311 20.26885
# accel_dumbbell_y     25.191142 27.55952 29.01028 26.68154 27.39678
# accel_dumbbell_z     19.475002 24.87712 25.45131 26.08463 25.74505
# magnet_dumbbell_x    22.010136 25.45332 27.75586 25.55996 21.86791
# magnet_dumbbell_y    30.124980 34.05631 37.72648 31.39418 27.97732
# magnet_dumbbell_z    40.288595 34.37342 44.30614 35.02756 32.68020
# roll_forearm         25.860816 22.66966 28.78117 20.84515 21.91093
# pitch_forearm        29.162757 29.24045 31.84036 31.04573 29.65329
# yaw_forearm          17.773518 18.59579 17.99397 19.49550 19.98122
# total_accel_forearm  15.589646 15.17746 16.02875 14.56172 12.63332
# gyros_forearm_x      12.433389 15.94968 16.93325 14.61963 13.93567
# gyros_forearm_y      13.506827 24.25570 21.09656 19.80983 18.34332
# gyros_forearm_z      14.481105 21.21246 18.28868 14.28118 14.73141
# accel_forearm_x      17.083582 23.30283 23.11078 25.45912 21.42423
# accel_forearm_y      17.096683 19.44859 19.51564 17.56969 19.70787
# accel_forearm_z      15.867608 21.61778 20.19868 20.34624 20.76946
# magnet_forearm_x     12.915633 18.24259 18.20786 16.85854 17.79264
# magnet_forearm_y     18.107227 20.14754 20.90716 19.81854 19.18390
# magnet_forearm_z     22.520361 26.98719 22.96736 24.78909 24.78300
#                      MeanDecreaseAccuracy MeanDecreaseGini
# num_window                       48.93532        910.60282
# roll_belt                        49.68440        751.03718
# pitch_belt                       45.96970        431.12159
# yaw_belt                         56.03408        514.08970
# total_accel_belt                 18.78659        142.48891
# gyros_belt_x                     21.83087         60.49028
# gyros_belt_y                     21.04511         69.67896
# gyros_belt_z                     28.31126        174.56329
# accel_belt_x                     22.09981         82.97144
# accel_belt_y                     16.40477         86.71501
# accel_belt_z                     29.49886        232.31573
# magnet_belt_x                    30.13166        168.86290
# magnet_belt_y                    27.32866        234.73676
# magnet_belt_z                    27.38195        238.70800
# roll_arm                         30.66771        193.12078
# pitch_arm                        26.40814         94.55148
# yaw_arm                          25.91384        126.09218
# total_accel_arm                  22.36654         57.98774
# gyros_arm_x                      26.60787         71.05501
# gyros_arm_y                      30.44733         73.98790
# gyros_arm_z                      20.42162         35.83323
# accel_arm_x                      18.82795        142.58789
# accel_arm_y                      24.78805         87.65977
# accel_arm_z                      23.42257         71.72324
# magnet_arm_x                     17.89184        161.40280
# magnet_arm_y                     17.25165        131.86050
# magnet_arm_z                     25.45451         98.03756
# roll_dumbbell                    30.50481        264.67907
# pitch_dumbbell                   16.31288        109.63799
# yaw_dumbbell                     25.41962        162.87929
# total_accel_dumbbell             25.13428        169.04953
# gyros_dumbbell_x                 29.67986         71.60816
# gyros_dumbbell_y                 22.05496        136.29237
# gyros_dumbbell_z                 32.38984         47.88063
# accel_dumbbell_x                 23.17576        159.48009
# accel_dumbbell_y                 33.83312        253.98877
# accel_dumbbell_z                 30.34442        200.89572
# magnet_dumbbell_x                26.71922        294.02448
# magnet_dumbbell_y                36.83429        415.55016
# magnet_dumbbell_z                46.96522        459.48619
# roll_forearm                     26.18858        346.86335
# pitch_forearm                    35.74011        471.94724
# yaw_forearm                      26.27559         93.48988
# total_accel_forearm              19.35926         60.79341
# gyros_forearm_x                  26.64580         43.04502
# gyros_forearm_y                  27.48480         65.99688
# gyros_forearm_z                  25.49793         46.04479
# accel_forearm_x                  23.93903        202.39162
# accel_forearm_y                  25.42013         81.21093
# accel_forearm_z                  25.53136        136.02994
# magnet_forearm_x                 18.96886        125.18426
# magnet_forearm_y                 25.20355        121.55069
# magnet_forearm_z                 32.08141        162.03961

# > confusionMatrix(modelFit2$predicted,trainnumm$"classe")
# Confusion Matrix and Statistics
# 
#           Reference
# Prediction    A    B    C    D    E
#          A 3650    8    0    0    0
#          B    0 2476    9    0    0
#          C    0    3 2217   18    0
#          D    0    0    0 2099    7
#          E    0    0    0    1 2347
# 
# Overall Statistics
#                                           
#                Accuracy : 0.9964          
#                  95% CI : (0.9952, 0.9974)
#     No Information Rate : 0.2844          
#     P-Value [Acc > NIR] : < 2.2e-16       
#                                           
#                   Kappa : 0.9955          
#  Mcnemar's Test P-Value : NA    
```
The accuracy of this model was **99.64%**

### Use of cross-validation
1. I used the final model from the rf to predict on the four cross validation training sets I created at the beginning.
2. To do this, I had to process the cross-validation sets in the same way (remove the unwanted columns, turn everything to numeric).
3. Then I used the predict function with the ModelFit2 as the RF model and each cross-validation set as the new data.


### Out of sample error
1. Based on the cross-validation models A,B,C,D, I did confusion matrices to find the four accuracies. They are:


```r
#acc
#[1] 99.64 99.64 99.59 99.59
```

2. Based on this, it looks like the out-of-sample error is quite low! The accuracy rates remain high even when used on the cross-validation sets.

### Predicting 20 cases
1. I did the same pre-processing to get the columns I wanted and turn everything into numeric.
2. Then I got the following results after the predict function:


```r
# > answers
#  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 
#  B  A  B  A  A  E  D  B  A  A  B  C  B  A  E  E  A  B  B  B 
```
1. They were all correct!
