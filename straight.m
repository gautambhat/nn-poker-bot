% Created by: Kavi, Gautam, Veena
% excluding 10,J,Q,K,A

function straight(col)

row = 11;

straight_mat = zeros(row, col);

%for spades
%for k = 1:4
    for j = 1:col
        
        %randomizing suit
        r_suit = randperm(4);
        index = randi(4); 
        
        %randomizing rank
        r_rank_seed = randi(9);
        r_rank = randperm(5) + r_rank_seed - 1;
        
        
        straight_mat(1, j) = r_suit(1);
        straight_mat(3, j) = r_suit(2);
        straight_mat(5, j) = r_suit(3);
        straight_mat(7, j) = r_suit(4);
        straight_mat(9, j) = r_suit(index);
        
        straight_mat(2, j) = r_rank(1);
        straight_mat(4, j) = r_rank(2);
        straight_mat(6, j) = r_rank(3);
        straight_mat(8, j) = r_rank(4);
        straight_mat(10, j) = r_rank(5);
        
        straight_mat(11,j) = 4;   
    end
%end

dlmwrite('straight.txt', straight_mat, ',');



end