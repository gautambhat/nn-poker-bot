function [decision] = turn_0(deck_, c1, c2,rf)

    probs = [50.1177, 42.2569, 4.7539, 2.1128, 0.3925, 0.1965, 0.1441, 0.024, 0.00139, 0.000154,];
    weights = [0.5,0.5,1,1,0.8,0.8,0.5,0.5,0.5,0.5];
    threshold = 1;
    
    V = combnk(deck_,3);
    [rv, colv] = size(V);
    for i = 1:rv
        V(i,4) = c1;
        V(i,5) = c2;
    end
    [rv, colv] = size(V); %updated dimensions
    
    freq = zeros(1,10);
    
    for i =1:rv
        thisClass = BLACK_BOX_NN(V(i,:));
        freq(thisClass) = freq(thisClass) + 1;
    end
   
%     plot(freq);
    freq
    decision = thinkPlay(freq,probs,weights,rf,threshold,500);

end