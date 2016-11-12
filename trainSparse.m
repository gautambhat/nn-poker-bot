%% CS294A/CS294W Programming Assignment Starter Code

%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  programming assignment. You will need to complete the code in sampleIMAGES.m,
%  sparseAutoencoderCost.m and computeNumericalGradient.m. 
%  For the purpose of completing the assignment, you do not need to
%  change the code in this file. 
%
%%======================================================================
%% STEP 0: Here we provide the relevant parameters values that will
%  allow your sparse autoencoder to get good filters; you do not need to 
%  change the parameters below.

visibleSize = 85;   % number of input units 
hiddenSize = 40;     % number of hidden units 
sparsityParam = 0.01;   % desired average activation of the hidden units.
%sparsityParam = 0.1;
                     % (This was denoted by the Greek alphabet rho, which looks like a lower-case "p",
		     %  in the lecture notes). 
lambda = 0.0001;     % weight decay parameter       
%lambda = 0.000000001;
beta = 3;            % weight of sparsity penalty term       
%beta = 0;
%%======================================================================
%% STEP 1: Implement sampleIMAGES
%
%  After implementing sampleIMAGES, the display_network command should
%  display a random sample of 200 patches from the dataset

patches = sampleCARDS2;
size(patches);
%display_network(patches(:,randi(size(patches,2),200,1)),8);


%  Obtain random parameters theta
theta = initializeParameters(hiddenSize, visibleSize);


%%======================================================================
%% STEP 2: Implement sparseAutoencoderCost
%
%  You can implement all of the components (squared error cost, weight decay term,
%  sparsity penalty) in the cost function at once, but it may be easier to do 
%  it step-by-step and run gradient checking (see STEP 3) after each step.  We 
%  suggest implementing the sparseAutoencoderCost function using the following steps:
%
%  (a) Implement forward propagation in your neural network, and implement the 
%      squared error term of the cost function.  Implement backpropagation to 
%      compute the derivatives.   Then (using lambda=beta=0), run Gradient Checking 
%      to verify that the calculations corresponding to the squared error cost 
%      term are correct.
%
%  (b) Add in the weight decay term (in both the cost function and the derivative
%      calculations), then re-run Gradient Checking to verify correctness. 
%
%  (c) Add in the sparsity penalty term, then re-run Gradient Checking to 
%      verify correctness.
%
%  Feel free to change the training settings when debugging your
%  code.  (For example, reducing the training set size or 
%  number of hidden units may make your code run faster; and setting beta 
%  and/or lambda to zero may be helpful for debugging.)  However, in your 
%  final submission of the visualized weights, please use parameters we 
%  gave in Step 0 above.

%lambda = 0;
%beta = 0;
%alpha = 1

[cost, grad, an] = sparseAutoencoderCost(theta, visibleSize, hiddenSize, lambda, ...
                                     sparsityParam, beta, patches);


%%======================================================================
% % STEP 3: Gradient Checking
% 
% Hint: If you are debugging your code, performing gradient checking on smaller models
% and smaller training sets (e.g., using only 10 training examples and 1-2 hidden
% units) may speed things up.
% 
% First, lets make sure your numerical gradient computation is correct for a
% simple function.  After you have implemented computeNumericalGradient.m,
% run the following:
checkNumericalGradient();
% 
% Now we can use it to check your cost function and derivative calculations
% for the sparse autoencoder.
numgrad = computeNumericalGradient( @(x) sparseAutoencoderCost(x, visibleSize, ...
                                                  hiddenSize, lambda, ...
                                                  sparsityParam, beta, ...
                                                  patches), theta);

% Use this to visually compare the gradients side by side
disp([numgrad grad]);
% 
% Compare numerically computed gradients with the ones obtained from backpropagation
diff = norm(numgrad-grad)/norm(numgrad+grad);
disp(diff); % Should be small. In our implementation, these values are
%             usually less than 1e-9.
% 
%             When you got this working, Congratulations!!!

%======================================================================
% % %% STEP 4: After verifying that your implementation of
% %  sparseAutoencoderCost is correct, You can start training your sparse
% %  autoencoder with minFunc (L-BFGS).
% 
% %  Randomly initialize the parameters
% theta = initializeParameters(hiddenSize, visibleSize);
% 
% %  Use minFunc to minimize the function
% addpath minFunc/
% options.Method = 'lbfgs'; % Here, we use L-BFGS to optimize our cost
%                           % function. Generally, for minFunc to work, you
%                           % need a function pointer with two outputs: the
%                           % function value and the gradient. In our problem,
%                           % sparseAutoencoderCost.m satisfies this.
% options.maxIter = 400;	  % Maximum number of iterations of L-BFGS to run 
% options.display = 'on';
% 
% [opttheta, cost] = minFunc( @(p) sparseAutoencoderCost(p, ...
%                                    visibleSize, hiddenSize, ...
%                                    lambda, sparsityParam, ...
%                                    beta, patches), ...
%                               theta, options);
%                           
% %patches = normalizeData(patches);
% % %%======================================================================
% %% STEP 5: Testing
% 
% outputSize = 10;
% W1 = reshape(opttheta(1:hiddenSize*visibleSize), hiddenSize, visibleSize);
% W2 = reshape(opttheta(hiddenSize*visibleSize+1:hiddenSize*visibleSize+hiddenSize*outputSize), outputSize, hiddenSize);
% b1 = opttheta(hiddenSize*visibleSize+hiddenSize*outputSize+1:hiddenSize*visibleSize+hiddenSize*outputSize+hiddenSize);
% b2 = opttheta(hiddenSize*visibleSize+hiddenSize*outputSize+hiddenSize+1:end);
% 
% display(size(W1));
% display(size(W2));
% display(size(b1));
% display(size(b2));
% 
% testing_data = sampleCARDS2_testing;
% 
% error = nnTesting(testing_data, W1, W2, b1, b2);
% display(error);
% 
