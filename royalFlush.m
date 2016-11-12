% Created by: Kavi, Gautam, Veena
% To create royal flushes in our data
% Prints data into txt file called royalFlush

function royalFlush(col)

% col = 4000;
row = 11;
hands = zeros(row,col);

for j = 1:col
    count = 1;
    a = randperm(5,5);
    
    for i = 2:2:row-1
      num = a(count);
      
      if num == 1
          hands(i,j) = num;
      else hands(i,j) = num + 8;
      end
      count = count + 1;
    end
        
    suit = randi(4);
    for i = 1:2:row-1
        hands(i,j) = suit;
    end
    
    hands(11,j) = 9;
    
end

dlmwrite('royalFlush.txt', hands, ',');

end