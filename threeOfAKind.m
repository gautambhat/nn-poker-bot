% Created by: Kavi, Gautam, Veena

function threeOfAKind

col = 13000;
row = 11;

three_of_a_kind_mat = zeros(row, col);
col_div = 1000;

for k = 1:13
    for j = 1:col_div
        
        r_perm = randperm(4);
        r_perm2 = randperm(4);
        
        other_card = randi(13);
        while other_card == k
            other_card = randi(13);
        end
        
        other_card2 = randi(13);
        while (other_card2 == k) || (other_card2 == other_card)
            other_card2 = randi(13);
        end
        
        perm_rank_array = [k,k,k,other_card,other_card2];
        index = randperm(5);
        
        three_of_a_kind_mat(2, j + col_div*(k-1)) = perm_rank_array(index(1));
        three_of_a_kind_mat(4, j + col_div*(k-1)) = perm_rank_array(index(2));
        three_of_a_kind_mat(6, j + col_div*(k-1)) = perm_rank_array(index(3));
        three_of_a_kind_mat(8, j + col_div*(k-1)) = perm_rank_array(index(4));
        three_of_a_kind_mat(10, j + col_div*(k-1)) = perm_rank_array(index(5));
        
        three_of_a_kind_mat(1, j + col_div*(k-1)) = r_perm(1);
        three_of_a_kind_mat(3, j + col_div*(k-1)) = r_perm(2);
        three_of_a_kind_mat(5, j + col_div*(k-1)) = r_perm(3);
        three_of_a_kind_mat(7, j + col_div*(k-1)) = r_perm2(4);
        three_of_a_kind_mat(9, j + col_div*(k-1)) = r_perm2(2);
        
        three_of_a_kind_mat(11, j + col_div*(k-1)) = 3;   
        
        
    end
end

dlmwrite('threeOfAKind.txt', three_of_a_kind_mat, ',');


end