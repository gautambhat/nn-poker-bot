% converts dataset into binary (95 rows)
% Created by: Kavi, Gautam, Veena

function sampleCARDS()

filename = 'poker-hand-training-true.txt';
delim_mat = transpose(dlmread(filename, ',')); %original data from the UCI database
%combining data that we generated
delim_mat = combineData(delim_mat,'royalFlush.txt');
delim_mat = combineData(delim_mat,'straightFlush.txt');
delim_mat = combineData(delim_mat,'fourOfAKind.txt'); 
delim_mat = combineData(delim_mat,'fullHouse.txt');
delim_mat = combineData(delim_mat,'flush.txt'); 
delim_mat = combineData(delim_mat,'straight.txt');
delim_mat = combineData(delim_mat,'threeOfAKind.txt');
delim_mat = combineData(delim_mat,'twoPair.txt');

% for i = 1:length(files)
%     file = files(i);
%     delim_mat = combineData(delim_mat,file);
% end

col = length(delim_mat);
row = length(delim_mat(:,1));

bin_patches = zeros(17*5 + 10, col);

%odd for suit
%even for rank
for j = 1:col
    counter = 0;
    for i = 1:row
        parity_checker = mod(i,2);
        % to convert the suit into binary
        if parity_checker == 1 && i ~= 11
            for suit = 1:4
                if delim_mat(i,j) == suit
                    bin_patches(17*fix(counter/2) + suit, j) = 1;
                end
            end
        end
        % to convert the card number into binary
        if parity_checker == 0
            for rank = 1:13
                if delim_mat(i,j) == rank
                    bin_patches(17*fix(counter/2) + 4 + rank, j) = 1;
                end
            end
        end
        counter = counter+1;
    end
    
    %converts last row (hand identifier) into binary
    for k = 0:9
        if delim_mat(11,j) == k
            bin_patches(85+1+k,j) = 1;
        end
    end   
end
                
%prints data to text file
dlmwrite('binary_poker.txt', bin_patches, ',');

end

