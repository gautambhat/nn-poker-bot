function [decision] = turn_3(c1,c2,next_3_cards,c6,c7,rf)

    c3 = next_3_cards(1);
    c4 = next_3_cards(2);
    c5 = next_3_cards(3);
    
    probs = [1,1,1,1,1,1,1,1,1,1];
    weights = [0.01,0.1,1,1.5,2.5,5,9.9,19.9,45,100];
    
    V = [c1, c2, c3, c4, c5, c6, c7];
    [rv,col] = size(V);
    
    freq = zeros(1,10);
    thisClass = secretSeven(V)
    freq(thisClass) = freq(thisClass) + 1;
    freq
    decision = thinkPlay(freq,probs,weights,rf,1,1);

end