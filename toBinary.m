function [bin_patches] = toBinary(delim_mat)

col = length(delim_mat(1,:)); 
row = length(delim_mat(:,1)); 

bin_patches = zeros(17*5 + 10, col);

%odd for suit
%even for rank
for j = 1:col
    counter = 0;
    for i = 1:row-1
        parity_checker = mod(i,2);
        if parity_checker == 1
            for suit = 1:4
                if delim_mat(i,j) == suit
                    bin_patches(17*fix(counter/2) + suit, j) = 1;
                end
            end
        end
        if parity_checker == 0
            for rank = 1:13
                if delim_mat(i,j) == rank
                    bin_patches(17*fix(counter/2) + 4 + rank, j) = 1;
                end
            end
        end
        counter = counter+1;
    end
    
    if row == 11
        for k = 0:9
            if delim_mat(row,j) == k
                bin_patches(85+1+k,j) = 1;
            end
        end
    end
end
end