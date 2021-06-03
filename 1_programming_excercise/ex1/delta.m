function tmp = delta(X,y,theta)
  tmp = zeros(length(theta),1);
  theta_vector = theta'.*X;
  minus_y = sum(theta_vector, 2)-y;
  
  for i = 1:length(theta)
   tmp(i) = sum(minus_y.*X(:,i))/length(y);
  endfor
endfunction
