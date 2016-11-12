%%Poker Player Agent, Mark I
%%It's brain is the Black Box Neural Network
%%Current Strategy incorporates the Secret 7 Algorithm and an unnamed 
%(probablistic) method containing an adjustable Risk Factor (RF) which is 
%a parameter determining the amount of risk (and bluff) the agent makes.
% Created by: Gautam, Kavi, Veena

function pokerplayer1
    num_cards = 52;
    suits = ['Hearts  ';'Spades  ';'Diamonds';'Clubs   '];
    class_names = ['High Card      ';'Pair           ';'Two Pairs      ';'Three of a kind';'Straight       ';'Flush          ';'Full house     ';'Four of a kind ';'Straight flush ';'Royal flush    '];
    deck = 1:1:52;
    deck_ = deck;
    result = [0;0];
    rf = 0.7; %risk factor : Could be any value, but ideally thought about keeping it between 0 and 1
    
    %%Simulate game of poker with no information about opponent, except for 
    %dealing him/her 2 cards for the sake of uniformity in rules. Either way it
    % doesn't matter since it's all randomized(or well shuffled, if you want to
    % be formal about it) anyway.
    %Generate 9 cards, deal 2nd and 4th to agent, and keep last 5 undisclosed 
    %for now.

    
    %input and display first two cards agent received
    card_1 = str2double(inputdlg('Input the card number (1-52) of Agent''s first card:'));
    card_2 = str2double(inputdlg('Input the card number (1-52) of Agent''s second card:'));
    name_c1 =  display_readable(card_1);
    name_c2 =  display_readable(card_2);
 
    
    %some abstractions relating to computations; the first two cards are
    %removed from the deck array
    if card_1 > card_2
        deck_(card_1) = [];
        deck_(card_2) = [];
    else deck_(card_2) = [];
        deck_(card_1) = [];
    end
    
    %turn 0
    decision(1) = turn_0(deck_, card_1, card_2,rf);
    prompt = sprintf('Continue(1)? Or Fold(0)?');
    user_input(1) = inputdlg(prompt);
    if str2double(user_input(1)) == 0
        return;
    end
    if decision(1) == 0
        msgbox('Agent Folded');
        return;
    end

    %reveal next 3 cards
    fprintf('\nTurning Next Three Cards... \n');
    card_3 = str2double(inputdlg('Input the card number (1-52) of first common card:'));
    card_4 = str2double(inputdlg('Input the card number (1-52) of second common card:'));
    card_5 = str2double(inputdlg('Input the card number (1-52) of third common card:'));
    next_3_cards = [card_3, card_4, card_5];
    for i=1:3
        name_3c(i) = display_readable(next_3_cards(i));
        sprintf('\n%s\n',name_3c(i));
        pause(0.4);
        for k = 1:length(deck_)
            if deck_(k) == next_3_cards(i)
                removal(i) = k;
            end
        end
    end
    sort(removal, 'descend');
    for i=1:length(removal)
        deck_(removal(i)) = [];
    end

    %turn 1:
    decision(2) = turn_1(deck_, card_1, card_2, next_3_cards,rf);
    user_input(2) = inputdlg(prompt);
    if str2double(user_input(2)) == 0
        return;
    end

    if decision(2) == 0
        msgbox('Agent folded...');
        return;
    end

    %reveal 4th hidden card
    fprintf('\nTurning Next Card... \n');
    card_6 = str2double(inputdlg('Input the card number (1-52) of the next common card:'));
    name_c6 = display_readable(card_6);
    sprintf('\n%s\n',name_c6);
    pause(0.4);
    for k = 1:length(deck_)
        if deck_(k) == card_6
            removal2 = k;
        end
    end
    deck_(removal2) = [];


    %turn 2:    
    decision(3) = turn_2(deck_, card_1, card_2, next_3_cards, card_6,rf);
    user_input(3) = inputdlg(prompt);
    if str2double(user_input(3)) == 0
        return; 
    end
    
    if decision(3) == 0
        msgbox('Agent folded...');
        return;
    end

    %reveal final card
    fprintf('\nTurning Final Card... \n');
    card_7 = str2double(inputdlg('Input the card number (1-52) of final common card:'));
    name_c7 = display_readable(card_7);
    sprintf('\n%s\n',name_c7)
    for k = 1:length(deck_)
        if deck_(k) == card_7
            removal3 = k;
        end
    end
    deck_(removal3) = [];

    %turn 3:
    decision(4) = turn_3(card_1, card_2, next_3_cards, card_6, card_7,rf);
    user_input(4) = inputdlg(prompt);
    if str2double(user_input(3)) == 0
        return;
    end
    
    if decision(4) == 0
        msgbox('Agent folded...');
        return;
    end
    %time for show of hands.
    opp_card_1 = str2double(inputdlg('Input the card number (1-52) of Opponents''s first card:'));
    opp_card_2 = str2double(inputdlg('Input the card number (1-52) of Opponents''s second card:'));
    agent_hand = secretSeven([card_1, card_2, next_3_cards, card_6, card_7]);
    opp_hand = secretSeven([opp_card_1, opp_card_2, next_3_cards, card_6, card_7]);
    fprintf('\nAgent has %s\n',class_names(agent_hand,:))
    pause(1);
    fprintf('\nOpponent has %s\n', class_names(opp_hand,:))
    pause(1);
    %deciding who won the hand. For now, if both have the
    %same hand, we are considering it a draw, rather than
    %comparing individual cards. Maybe that'll change in
    %the future.
    if agent_hand > opp_hand
        result = [1;0];
        msgbox('Agent wins! Go AlphaPo!');
        return;
    elseif agent_hand < opp_hand
        result = [0;1];
        msgbox('Opponent wins! Learn better, AlphaPo!');
        return;
    end
    msgbox('Both players have similar hands. Programs gives that a draw!');
    return; 


end
