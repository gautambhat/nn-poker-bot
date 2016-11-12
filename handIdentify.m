% Created by: Kavi, Gautam, Veena
% Categorizes the type of hand from 5 random cards
% Requires: addData.m

function [hands] = handIdentify(patches)

[row, col] = size(patches);
hands = zeros(1,col);

for j=1:col
    for i=1:2:row
        card = patches(i+1,j);
%         switch(card)
%             case 1
%                 card = 'A';
%             case 11
%                 card = 'J';
%             case 12
%                 card = 'Q';
%             case 13
%                 card = 'K';
%         end
        switch(patches(i,j))
            case 1
                fprintf('%i of Hearts\n',card);
            case 2
                fprintf('%i of Spades\n',card);
            case 3
                fprintf('%i of Diamonds\n',card);
            case 4
                fprintf('%i of Clubs\n',card);
        end
    end
    hands(1,j) = input('');
end