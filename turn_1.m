function [decision] = turn_1(deck_, c1, c2, next_3_cards,rf)

    c3 = next_3_cards(1);
    c4 = next_3_cards(2);
    c5 = next_3_cards(3);

    probs = [50.1177, 42.2569, 4.7539, 2.1128, 0.3925, 0.1965, 0.1441, 0.024, 0.00139, 0.000154,];
    weights = [0.1,0.3,4,2,0.8,0.8,0.5,0.5,0.8,0.8];
    threshold = 1;
    
    V = combnk(deck_,2);
    [rv, colv] = size(V);
    for i = 1:rv
        V(i,3) = c1;
        V(i,4) = c2;
        V(i,5) = c3;
        V(i,6) = c4;
        V(i,7) = c5;
    end
    [rv, colv] = size(V); %updated dimensions
    
    freq = zeros(1,10);
    
    for i =1:rv
        thisClass = secretSeven(V(i,:));
        freq(thisClass) = freq(thisClass) + 1;
    end
    freq
    decision = thinkPlay(freq,probs,weights,rf,threshold,100);
end