# machine-learning-coursera

# This is my work on the Machine Learning course on coursera. 

## Software used: Octave/MATLAB.

## Main contributions:
- Libraries like PyTorch and Tensorflow, Keras have already built functions that user can use directly out of the box
Problem: the lack of understanding basic Machine Learning algrorithms which leads to wrong decisions during building the 
solution for real-world problems.
Solution: hand write basic algorithms of ML to understand their the pros and cons. Calculate manually the gradients, derivatives, normalizers, optimizators, etc...

In the following list I mentioned the files that I wrote manually for the ML and AI tasks. 

### Ex1: Linear Regression
Handwritten functions for:
1. normalEqn.m - Function to conpute the normal equations
2. featureNormalize.m - Function to normalize features
3. gradientDescentMulti.m - Gradint descent for multiple variables
4. computeCostMulti.m - Cost function for multiple variables
5. gradientDescent.m - Function to run gradient descent
6. computeCost.m - Function compute the cost of the linear regression
7. plotData.m - Function to display the dataset
8. warmUpExercise.m - Simple example function in Octave/MATLAB

### Ex2: Logistic Regression
Handwritten functions for:
1. plotData.m - Function to plot 2D classification data
2. sigmoid.m - Sigmoid Function
3. costFunction.m - Logistic Regression Cost Function
4. predict.m - Logistic Regression Prediction Function
5. costFunctionReg.m - Regularized Logistic Regression Cost

### Ex3: Multi-Class Classification and Neural Networks for digit recognition.
1. lrCostFunction.m - Logistic Regression cost function
2. oneVsAll.m - Train a one-vs-all multi-class classifier
3. predictOneVsAll.m - Predict using a one-vs-all multi-class classifier
4. predict.m - Neural network prediction function 

### Ex4: Neural Networks Learning.
1. sigmoidGradient.m - Compute the gradient of the sigmoid function 
2. randInitializeWeights.m - Randomly initialize weights
3. nnCostFunction.m - Neural network cost function

### Ex5: Regularized Linear Regression and Bias v.s. Variance.
Motivation:
Since simple linear regression and polynomial model tends to overfit on the training set, we have to 
add the regularization term. It penalizes the model parameters for overfitting. 
1. linearRegCostFunction.m - Regularized linear regression cost function.
2. learningCurve.m - Generates a learning curve.
3. polyFeatures.m - Maps data into polynomial feature space.
4. validationCurve.m - Generates a cross validation curve.

### Ex6: Support Vector Machines. 
1. gaussianKernel.m - Gaussian kernel for SVM
2. dataset3Params.m - Parameters to use for Dataset 3
3. processEmail.m - Email preprocessing
4. emailFeatures.m - Feature extraction from emails

### Ex7: K-means Clustering and Principal Component Analysis.
In this exercise I performed the K-means clustering algorithm for image compression.
This algorithm tries to find the points of main semantic weight in the image and 
removing non-semantically important data to make the image size lower. 

1. pca.m - Perform principal component analysis
2. projectData.m - Projects a data set into a lower dimensional space
3. recoverData.m - Recovers the original data from the projection
4. findClosestCentroids.m - Find closest centroids (used in K-means)
5. computeCentroids.m - Compute centroid means (used in K-means)
6. kMeansInitCentroids.m - Initialization for K-means centroids

### Ex8: Anomaly Detection and Recommender Systems.
In this excercise I discover the anomaly detection on the servers inside the network.
Additionaly, I experiment on unsupervised learning predicting the number of points
that user will give to a particular movie based on his previous reviews. 
1. estimateGaussian.m - Estimate the parameters of a Gaussian distribution with a diagonal covariance matrix
2. selectTreshold.m - Find a threshold for anomaly detection
3. cofiCostFunc.m - Implement the cost function for collaborative filtering