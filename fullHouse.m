% Created by: Kavi, Gautam, Veena

function fullHouse(col)
 
% col = 4000;
row = 11;
hands = zeros(row,col);

for j = 1:col

    card = randperm(13,2); %two numbers for the full house
    suit1 = randperm(4,3); %for the 3 of a kind
    suit2 = randperm(4,2); %for the 2 of a kind
    count = 1;
    suitCount = 1;
    indexRan = randperm(5);
    
    for i = 1:5
        if count < 4
            hands(2*indexRan(i),j) = card(1);
            hands(2*indexRan(i)-1,j) = suit1(count);
        else hands(2*indexRan(i),j) = card(2);
            hands(2*indexRan(i)-1,j) = suit2(suitCount);
            suitCount = suitCount + 1; %keep track of the suit count (veena can explain)
        end
        count = count + 1;
        
    end
    
hands(11,j) = 6;

end

dlmwrite('fullHouse.txt', hands, ',');

end