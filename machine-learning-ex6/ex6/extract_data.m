function [X, y] = extract_data()
  % extract data from my file
  path_hams = dir('email_samples/easy_ham');
  hams_pre = 'email_samples/easy_ham/';
  path_spams = dir('email_samples/spam');
  spams_pre = 'email_samples/spam/';
  X = []; y = zeros(length(path_hams) + length(path_spams) - 4, 1);
  for i=3:length(path_hams)
    file_contents = readFile(strcat(hams_pre, path_hams(i).name));
    word_indices = processEmail(file_contents);
    features = emailFeatures(word_indices);
    X = [X; features];
    y = [y ; 0];
  endfor
  save my_data1.mat X, y
  
  for i=3:length(path_spams)
    file_contents = readFile(stracat(spams_pre, path_spams(i).name));
    word_indices = processEmail(file_contents);
    features = emailFeatures(word_indices);
    X = [X; features];
    y = [y; 1]
  endfor
  
  save my_data2.mat X, y
endfunction
