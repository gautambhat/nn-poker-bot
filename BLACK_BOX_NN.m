% Running trained neural network with poker game
% uses blackBox.m 
% Created by: Kavi, Veena, Gautam

function [class] = BLACK_BOX_NN(V)
    
%     V = [1,52,13,26,21];

    cards = zeros(10,1);
    for i = 1:5
        S = ceil(V(i)/13);
        if mod(V(i),13) == 0
            C = 13;
        else C = mod(V(i),13);
        end
        cards(2*i,1) = C;
        cards((2*i)-1, 1) = S;
    end
    result = blackBox(cards);
    maxClass = 1;
    for i = 1:10
        result(i,1);
        if result(i,1) > result(maxClass,1)
            maxClass = i;
        end
    end
    class = maxClass;
        
end
