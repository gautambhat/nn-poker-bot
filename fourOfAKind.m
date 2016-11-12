% Created by: Kavi, Gautam, Veena

function fourOfAKind

col = 7995;
row = 11;
 
four_of_a_kind_mat = zeros(row, col);
col_div = 615;



for k = 1:13
    for j = 1:col_div
        
        r_perm = randperm(4);
        r_perm2 = randperm(4);
        
        other_card = randi(13);
        while other_card == k
            other_card = randi(13);
        end
        
        perm_rank_array = [k,k,k,k,other_card];
        index = randperm(5);
        
        four_of_a_kind_mat(2, j + col_div*(k-1)) = perm_rank_array(index(1));
        four_of_a_kind_mat(4, j + col_div*(k-1)) = perm_rank_array(index(2));
        four_of_a_kind_mat(6, j + col_div*(k-1)) = perm_rank_array(index(3));
        four_of_a_kind_mat(8, j + col_div*(k-1)) = perm_rank_array(index(4));
        four_of_a_kind_mat(10, j + col_div*(k-1)) = perm_rank_array(index(5));
        
        four_of_a_kind_mat(1, j + col_div*(k-1)) = r_perm(1);
        four_of_a_kind_mat(3, j + col_div*(k-1)) = r_perm(2);
        four_of_a_kind_mat(5, j + col_div*(k-1)) = r_perm(3);
        four_of_a_kind_mat(7, j + col_div*(k-1)) = r_perm(4);
        four_of_a_kind_mat(9, j + col_div*(k-1)) = r_perm2(2);
        
        four_of_a_kind_mat(11, j + col_div*(k-1)) = 7;   
        
        
    end
end

dlmwrite('fourOfAKind.txt', four_of_a_kind_mat, ',');
end
