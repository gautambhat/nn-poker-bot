% Created by: Kavi, Gautam, Veena
% excluding A,2,3,4,5

function straightFlush(col)

% col = 4000;
row = 11;

straight_flush_mat = zeros(row, col);

%for spades
for k = 1:4
    for j = 1:1000
        r = randi(8);
        r_perm = randperm(5) + r;
        straight_flush_mat(1, j + 1000*(k-1)) = k;
        straight_flush_mat(3, j + 1000*(k-1)) = k;
        straight_flush_mat(5, j + 1000*(k-1)) = k;
        straight_flush_mat(7, j + 1000*(k-1)) = k;
        straight_flush_mat(9, j + 1000*(k-1)) = k;
        
        straight_flush_mat(2, j + 1000*(k-1)) = r_perm(1);
        straight_flush_mat(4, j + 1000*(k-1)) = r_perm(2);
        straight_flush_mat(6, j + 1000*(k-1)) = r_perm(3);
        straight_flush_mat(8, j + 1000*(k-1)) = r_perm(4);
        straight_flush_mat(10, j + 1000*(k-1)) = r_perm(5);
        
        straight_flush_mat(11,j + 1000*(k-1)) = 8;   
    end
end

dlmwrite('straightFlush.txt', straight_flush_mat, ',');

    




end