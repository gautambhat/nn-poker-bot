function [decision] = thinkPlay(freq,probs,weights,rf,threshold,turnWeight)

    newW = weights.*freq;
    temp = zeros;
    for i = 1:length(newW)
        temp(i) = newW(i)./probs(i);
    end
    
    D = (rf/turnWeight)*sum(temp)
    pause(2);
    if D > threshold
        decision = 1;
    else decision = 0;
    end

end