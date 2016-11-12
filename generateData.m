%To create more data for our NN to train on
%Created by: Kavi, Gautam, Veena

function generateData

moreData = 8000;

%calls following functions to create data for specified hand
flush(moreData);
fourOfAKind;
fullHouse(moreData);
royalFlush(moreData);
straight(moreData);
straightFlush(moreData);
threeOfAKind;
twoPair(moreData);

end