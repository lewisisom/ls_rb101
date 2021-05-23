GAME_NAME = 'Twenty-One'
MAX_VALUE = 21
DEALER_MIN = 17
STARTING_CARDS = 2
WINS_REQUIRED = 5
SUITS = ['♣', '♦', '♥', '♠']
VALUES = { 'A' => 11, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
           '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
           'J' => 10, 'Q' => 10, 'K' => 10 }

def prompt(msg)
  puts ">> #{msg}"
  sleep(0.2)
end

def correct_for_aces(pd)
  pd[:total] -= 10 if pd[:total] > MAX_VALUE && pd[:hand].last.start_with?('A')
end

def add_card(pd, deck)
  pd[:hand] << deck.pop
  pd[:total] += VALUES[pd[:hand].last[0..-2].to_s]
  correct_for_aces(pd)
  pd[:cards] += 1
end

def calc_win(ply, del)
  return false if ply[:busted] == true
  return true if del[:busted] == true
  return false if del[:total] > ply[:total]
  true
end

def update_winnings(ply, del, wins)
  result = calc_win(ply, del) ? :player : :dealer
  wins[result] += 1
end

def display_win(ply, del)
  msg = calc_win(ply, del) ? 'won' : 'lost'
  del_msg = del[:busted] ? 'busted with' : 'got'
  prompt "Ah, rats! You're busted. You took too many cards." if ply[:busted]
  prompt "You #{msg}!! The dealer #{del_msg} #{del[:total]} points " \
  "and their hand was #{del[:hand].join(' - ')}."
end

def play_again?
  prompt "Would you like to play this game again? 'yes' or 'no':"
  choice = gets.chomp
  until choice.downcase.start_with?('y') || choice.downcase.start_with?('n')
    prompt "Sorry, what was that? Type yes to play again or no to quit."
    choice = gets.chomp
  end
  again = choice.downcase.start_with?('y')
  if again
    prompt "Alright! Let's go for another round, matey!"
    sleep(2)
  end
  again
end

def player_turn(ply, del, deck)
  loop do
    prompt "Right now, your deck is #{ply[:hand].join(' - ')} " \
    "and one of the dealer's cards is #{del[:hand].first}."
    prompt "That means you've got #{ply[:total]} points " \
    "and #{ply[:cards]} cards."
    prompt "Will you 'hit' or 'stay'? (Type 'h' or 's')"
    break if player_stay?
    add_card(ply, deck)
    if ply[:total] > MAX_VALUE
      ply[:busted] = true
      break
    end
  end
end

def player_stay?
  choice = gets.chomp
  until choice.downcase.start_with?('h') || choice.downcase.start_with?('s')
    prompt "Sorry, what was that? Type and enter h to hit or s to stay."
    choice = gets.chomp
  end
  true if choice.downcase.start_with?('s')
end

def dealer_turn(ply, del, deck)
  prompt "It's the dealer's turn now..."
  sleep(1)
  until del[:total] >= DEALER_MIN || ply[:busted] == true
    prompt "Dealer hits!"
    add_card(del, deck)
  end
  del[:busted] = true if del[:total] > MAX_VALUE
end

def welcome
  system 'clear'
  prompt "Welcome to #{GAME_NAME}! Try to get more points than the dealer,
    but be careful, you'll bust if you go over #{MAX_VALUE}!"
  prompt "Jacks, Queens, and Kings are worth 10 points.
    Cards 2 through 10 are their face value. Aces are either 1 or 11."
  prompt "Both you and the dealer begin with #{STARTING_CARDS} cards.
    The dealer will automatically hit to get another card
    until they've gotten atleast #{DEALER_MIN} points."
  prompt "Win #{WINS_REQUIRED} rounds to win the game!"
  prompt "Press enter to start playing:"
  gets
  system 'clear'
end

def next_round(wins)
  prompt "Alright. You've won #{wins[:player]} rounds and the dealer's " \
  "won #{wins[:dealer]} rounds."
  prompt "Press enter to move on the next round:"
  gets
  system 'clear'
end

def game_over(wins)
  winner = wins[:player] >= WINS_REQUIRED ? 'You' : 'The dealer'
  system 'clear'
  prompt "Game over!! #{winner} won #{WINS_REQUIRED} rounds. " \
  "#{winner} won the game!"
  if winner == 'You'
    prompt "Congrats man. I knew you'd win."
  else
    prompt "Sorry man. I bet you could win if you tried again."
  end
end

player = { total: 0, busted: false, cards: 0, hand: [] }
dealer = { total: 0, busted: false, cards: 0, hand: [] }

loop do
  welcome
  wins = { player: 0, dealer: 0 }
  loop do
    player = { total: 0, busted: false, cards: 0, hand: [] }
    dealer = { total: 0, busted: false, cards: 0, hand: [] }
    deck = VALUES.keys.product(SUITS).map(&:join).shuffle

    STARTING_CARDS.times do
      add_card(player, deck)
      add_card(dealer, deck)
    end

    player_turn(player, dealer, deck)
    dealer_turn(player, dealer, deck) if player[:busted] == false

    calc_win(player, dealer)
    update_winnings(player, dealer, wins)
    display_win(player, dealer)

    next_round(wins)
    break if wins.value?(WINS_REQUIRED)
  end

  game_over(wins)
  break unless play_again?
end

prompt "Thanks for playing #{GAME_NAME}! Have a good one!"
