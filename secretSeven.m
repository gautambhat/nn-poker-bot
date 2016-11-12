function [class] = secretSeven(C) %c should be 1x7

    class_names = ['High Card      ';'Pair           ';'Two Pairs      ';'Three of a kind';'Straight       ';'Flush          ';'Full house     ';'Four of a kind ';'Straight flush ';'Royal flush    '];
%     C = randperm(52,7); %1x7
%     for i = 1:length(C)
%         display_readable(C(i));
%     end
    V = combnk(C,5);    %21x5
    freq = zeros(1,10);
    for i = 1:21
        thisClass = BLACK_BOX_NN(V(i,:));
        freq(thisClass) = freq(thisClass) + 1;
    end
%     freq
    
    class = 1;
    for i = 1:length(freq)
        if freq(i) > 1
            class = i;
        end
    end
%     class_names(class,:)
%     class
end