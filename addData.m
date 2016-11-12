% Adds N sets of 5 random cards to the dataset
% Requires handIdentify.m 
% Created by: Kavi, Gautam, Veena


function addData

col = 100;
row = 52;
data = zeros([row,col]); %52x10000
patches = zeros([10,col]);

for i = 1:col
    a = randperm(52,5);
    
    for j = 1:5
        data(a(j),i) = 1;
    end
end

for j = 1:col
    count = 1;
    for i = 1:row
        if(data(i,j) == 1)
            S = ceil(i/13); %that gives me the suit number :)
            if(mod(i,13) == 0)
                C = 13;
            else C = mod(i,13);
            end
        patches(count,j) = S;
        patches(count+1,j) = C;
        count = count+2;
        end
    end
end

hands = handIdentify(patches);

patches = vertcat(patches,hands);

dlmwrite('more_data_poker_200.txt', patches, ',');


end