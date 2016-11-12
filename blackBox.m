% Running trained neural network with new data
% Created by: Kavi, Gautam, Veena

function [results] = blackBox(cards)

    net = load('nnet.mat');
%     cards = [2;12;2;13;2;10;2;11;2;9];

    cards = toBinary(cards);
    cards = cards(1:85,:);
    
    results = sim(net.net,cards);
end