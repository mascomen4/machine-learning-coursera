function [best_C, best_sigma] = best_pair_params(X, y, Xval, yval, C, sigma)
  % Return best set of params C and sigma
  best_C = 0;
  best_sigma = 0;
  n_c = length(C);
  n_sigma = length(sigma);
  min_error = 1000000000000000000;
  
  for i = 1:n_c
    for j = 1:n_sigma
      model = svmTrain(X, y, C(i), @(x1, x2) gaussianKernel(x1, x2, sigma(j)));
      predictions = svmPredict(model, Xval);
      error = mean(double(predictions ~= yval));
      if (error < min_error)
        min_error = error;
        best_C = C(i);
        best_sigma = sigma(j);
      endif
    endfor
  endfor
endfunction
