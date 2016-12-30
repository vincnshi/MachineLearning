function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.03;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%

%results = eye(64,3);
%errorRow = 0;

%for C_test = [0.01 0.03 0.1 0.3 1, 3, 10 30]
%    for sigma_test = [0.01 0.03 0.1 0.3 1, 3, 10 30]
%        errorRow = errorRow + 1;
%        model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
%        predictions = svmPredict(model, Xval);
%        prediction_error = mean(double(predictions ~= yval));
%
%        results(errorRow,:) = [C_test, sigma_test, prediction_error];
%        fprintf('results content after iteration %d \n', errorRow);
%        results
%        fprintf('Program paused. Press enter to continue.\n');
%        pause;
%    end
%end

%sorted_results = sortrows(results, 3); % sort matrix by column #3, the error, %ascending
%
%C = sorted_results(1,1);
%sigma = sorted_results(1,2);


C_test = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_test = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];

m = size(C_test,1);
n = size(sigma_test,1);
error_row = 0
%results_all = eye(64,5);

for i = 1:m
    for j = 1:n
        a = C_test(i);
        b = sigma_test(j);
        error_row = error_row + 1;
        model = svmTrain(X, y, a, @(x1, x2) gaussianKernel(x1, x2, b));
        predictions = svmPredict(model, Xval);
        prediction_error = mean(double(predictions ~= yval));

        results(error_row,:) = [a, b, prediction_error];
    end;
    %results_all = [i, results_part];
end;

results_sorted = sortrows(results,3);

fprintf('results content after iteration %d \n', error_row);
results_sorted
fprintf('Program paused. Press enter to continue.\n');
pause;

C = results_sorted(1,1);
sigma = results_sorted(1,2);








% =========================================================================

end
