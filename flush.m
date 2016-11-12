% Created by: Kavi, Gautam, Veena

function flush(col)

row = 11;

flush_mat = zeros(row, col);
col_div = 1000;

for k = 1:4
    for j = 1:col_div
        r_perm = randperm(13);
        
        flush_mat(1, j + col_div*(k-1)) = k;
        flush_mat(3, j + col_div*(k-1)) = k;
        flush_mat(5, j + col_div*(k-1)) = k;
        flush_mat(7, j + col_div*(k-1)) = k;
        flush_mat(9, j + col_div*(k-1)) = k;
        
        flush_mat(2, j + col_div*(k-1)) = r_perm(1);
        flush_mat(4, j + col_div*(k-1)) = r_perm(2);
        flush_mat(6, j + col_div*(k-1)) = r_perm(3);
        flush_mat(8, j + col_div*(k-1)) = r_perm(4);
        flush_mat(10, j + col_div*(k-1)) = r_perm(5);
        
        flush_mat(11,j + 1000*(k-1)) = 5;   
        
    end    
end

dlmwrite('flush.txt', flush_mat, ',');

end