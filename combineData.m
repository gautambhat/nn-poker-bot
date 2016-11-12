% to concate data from files into an array and send back
% Created by: Kavi, Gautam, Veena

function [delim_mat] = combineData(data1,f2)

data2 = dlmread(f2, ',');

delim_mat = horzcat(data1,data2);

end