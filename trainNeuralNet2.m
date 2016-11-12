% Created by: Kavi, Gautam, Veena

patches = dlmread('binary_poker.txt', ',');
inputSize = 85; %number of input units 
hiddenSize = 40;  %number of hidden nodes
outputSize = 10;
lambda = 0.0001;  
theta = initializeParameters(hiddenSize, inputSize); %Obtain random parameters theta

%[cost, grad, an] = neuralNet2(theta, inputSize, hiddenSize, lambda, patches);
options.Method = 'lbfgs';
options.maxIter = 400;	
options.display = 'on';
[opttheta, cost] = minFunc( @(p) neuralNet2(theta, inputSize, hiddenSize, outputSize, lambda, patches) ,options);