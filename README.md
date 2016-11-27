# nn-poker-bot
A neural network implementation of a poker bot that devises a playing strategy based on the cards it currently has. 

(Collaborated with : Kaviasaran Selvam, Veena Dali)


__Important:__ This file describes how to run the code for our project, which is our attempt at an NN-based poker hand-learning and game-playing bot, codenamed “AlphaPo”. It is important to note that, this project does not implement all rules of poker yet, such as betting. For now, our approach is rather boolean, which means AlphaPo decides whether to continue playing or to fold, based on the cards it has received, rather than betting and raising certain amounts of money (which is currently beyond the scope of our project). Moreover, one more aspect that is beyond the scope of our project for now is strength among hands, which basically means deciding who’s hand is stronger, given both have the same category of hands - if both players have a two pair, any two pair, it’s a draw. This is because of lack of data in this aspect. Producing enough data to implement this functionality was not viable given the timeline of our project, and can be easily implemented in the future if the data is provided. We shall refer to this version minus thebetting and intra-hand strength aspects as “experimental” Texas Hold’em. The essence is for the bot to
1. be able to recognize the hand it has received (High Card, Two Pair, Royal Flush…etc)
2. be able to understand the value or strength of the cards it has been dealt, despite not having all cards known. I.e., It should be able to decide whether or not the first two (and subsequent) cards it has been dealt are any good. This is how the bot shall decide its next move.

Keeping these points in mind, the following text will describe how to process the dataset, train the neural net, and play experimental poker with AlphaPo


##Part 1 : Process Data

1. Run ‘generateData.m’
  1. Location: generateData/generateData.m
  2. Increase and improve dataset to improve classification - each of these outputs a text file with data in the same format as the UCI dataset
2. Run ‘sampleCARDS.m’
  1. Converts data into binary and combines into one array
  2. Exports final data into a file called binary_poker.txt - This is the file that will be used to train our neural network



##Part 2 : Train Neural Network

1. Run ‘matlab_nndriver.m’



##Part 3 : Use NN to play experimental Texas Hold’em Poker

1. Run ‘pokerplayer1.m’
2. The current code accepts dealt cards as input prompts (part of code where cards are dealt by program is commented out). It is important to note down the format in which cards are represented: 
  *Each card is numbered uniquely from 1-52.
  *1 denotes Ace.
  *2-10 are as usual 2-10
  *11, 12, and 13 denote Jack, Queen, and King, respectively.
  *1-13 are Hearts, 14-26 are Spades, 27-39 are Hearts, and 40-52 are Clubs.
  *Therefore, for example, 14 is the Ace of Spades.
  *One more example, 38 is the Queen of Diamonds.
  *Final example and then we move on, 7 is the 7 of Hearts.
3. The program will prompt in the following order (assuming neither AlphaPo, or the opponent, folds) :
  1. First card dealt to AlphaPo
  2. Second card dealt to Alpha Po
  3. The opponent’s decision in this round (1 for ‘Continue Playing’, 0 for ‘Fold’)
  4. The first common card
  5. The second common card
  6. The third common card
  7. The opponent’s decision in the second round
  8. The fourth common card
  9. The opponent’s decision in the third round
  10. The fifth common card
  11. The opponent’s decision in the fourth round
  12. The opponent’s first card
  13. The opponent’s second card
  
Remember to input the correct card number (1-52) and decision (1 or 0 only) !


__Note:__Being implemented in matlab, minus GPU-running capabilities, the bot takes about
a minute to make its decisions in the first two rounds.

For further questions or queries about the project, contact : gautam@bu.edu
