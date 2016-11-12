% Created by: Gautam, Kavi, Veena

function [name] = display_readable(card)
    
    suits = ['Hearts  ';'Spades  ';'Diamonds';'Clubs   '];
    disp_S = suits(ceil(card/13),:);
    if(mod(card,13) == 0)
        disp_C = 13;
    else disp_C = mod(card,13);
    end
    
    name = fprintf('%i of %s\n',disp_C, disp_S);
end