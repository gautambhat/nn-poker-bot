% Created by: Kavi, Gautam, Veena

function twoPair(col)

% col = 4000;
row = 11;
hands = zeros(row,col);

for j = 1:col

    card = randperm(13,3); %two numbers for the full house
    suit1 = randperm(4,2); %for the first pair
    suit2 = randperm(4,2); %for the second pair
    suit3 = randi(4);
    count = 1;
    suitCount = 1;
    indexRan = randperm(5);
    finalCard = card(3);
    
    for i = 1:5
        if count < 3
            hands(2*indexRan(i),j) = card(1);
            hands(2*indexRan(i)-1,j) = suit1(count);
        elseif (count == 3) || (count == 4)
            hands(2*indexRan(i),j) = card(2);
            hands(2*indexRan(i)-1,j) = suit2(suitCount);
            suitCount = suitCount + 1; %keep track of the suit count (veena can explain)
        else hands(2*indexRan(i),j) = finalCard;
            hands(2*indexRan(i)-1,j) = suit3;
        end
        count = count + 1;
        
    end
    
hands(11,j) = 2;

end

dlmwrite('twoPair.txt', hands, ',');

end