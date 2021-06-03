function [train_error, val_error] = averageError(X, y, Xval, yval, n, lambda)
  %AVERAGEERRORFUNCTION 
  number_of_cycles = 50;
  train_m = size(X, 1);
  val_m = size(Xval, 1);
  train_error_vec = zeros(number_of_cycles, 1);
  val_error_vec = zeros(number_of_cycles, 1);
  
  for i = 1:number_of_cycles
    train_ind = randperm(train_m, n);
    val_ind = randperm(val_m, n);
    generated_X = X(train_ind, :);
    generated_y = y(train_ind);
    generated_Xval = Xval(val_ind, :);
    generated_yval = yval(val_ind);
    
    theta = trainLinearReg(generated_X, generated_y, lambda);
    train_error_vec(i) = linearRegCostFunction(generated_X, generated_y, theta, 0);
    val_error_vec(i) = linearRegCostFunction(generated_Xval, generated_yval, theta, 0);
  endfor 
  
  train_error = mean(train_error_vec);
  val_error = mean(val_error_vec);
  
endfunction
