# generate the deck of all 52 cards and store it in some data structure
# randomly get 4 cards out of the deck, give 2 to player and 2 to dealer
# show player both their cards plus one (random) of the cards the dealer has
# keep ask the player for a move (either hit or stay) until they stay
# if player ever has over 21 total, display a player losing message and ask to play again
# dealer will hit (get another random card from the remaining deck) until >= 17 total
# if dealer ever has over 21 total, display a player winning message and ask to play again
# if neither player nor dealer busts, then compare hand values to determine the winner
# display a game end message with whoever had the highest hand value as the winner
# ask if they want to play another game, if not, say goodbye and thanks for playing

# important points:
# make sure cards get removed from the deck when they are got from the deck
# the dealer will be the computer

# OLD_VALUES = { Ace: 'A', Two: '2', Three: '3', Four: '4', Five: '5', Six: '6', Seven: '7',
#           Eight: '8', Nine: '9', Ten: '10', Jack: 'J', Queen: 'Q', King: 'K' }

# (worth[0] - 10) if hand_total > 21

# SUITS = { Clubs: '♣', Diamonds: '♦', Hearts: '♥', Spades: '♠' }

=begin
VALUES = { 'A' => 11, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
         '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }
deck = ['A♣', '2♣', '3♣', '4♣', '5♣', '6♣', '7♣', '8♣', '9♣', '10♣', 'J♣', 'Q♣', 'K♣',
        'A♦', '2♦', '3♦', '4♦', '5♦', '6♦', '7♦', '8♦', '9♦', '10♦', 'J♦', 'Q♦', 'K♦',
        'A♥', '2♥', '3♥', '4♥', '5♥', '6♥', '7♥', '8♥', '9♥', '10♥', 'J♥', 'Q♥', 'K♥',
        'A♠', '2♠', '3♠', '4♠', '5♠', '6♠', '7♠', '8♠', '9♠', '10♠', 'J♠', 'Q♠', 'K♠'].shuffle

def add_card(pd, deck)
  pd[:hand] << deck.pop
  pd[:total] += VALUES[pd[:hand].last[0..-2].to_s]
  pd[:cards] += 1
end

def calc_win(ply, del)
  return false if ply[:busted] == true
  return true if del[:busted] == true
  return false if del[:total] > ply[:total]
  true
end

def display_win
  # stuff
  p 'HI THIS IS NOT DONE'
end

player = { total: 0, busted: false, cards: 0, hand: [] }
dealer = { total: 0, busted: false, cards: 0, hand: [] }

2.times do
  add_card(player, deck)
  add_card(dealer, deck)
end

loop do
  puts ">> Will you 'hit' or 'stay'? (You currently have #{player[:cards]} cards.)"
  choice = gets.chomp
  break if choice.downcase.start_with?('s') || player[:total] > 21
  add_card(player, deck)
end

player[:busted] = true if player[:total] > 21

add_card(dealer, deck) until dealer[:total] >= 17 || player[:busted] == true
dealer[:busted] = true if dealer[:total] > 21

p calc_win(player, dealer)
display_win
=end
