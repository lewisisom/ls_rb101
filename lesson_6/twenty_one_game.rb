SUITS = ['♣', '♦', '♥', '♠']
VALUES = { 'A' => 11, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
           '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
           'J' => 10, 'Q' => 10, 'K' => 10 }

def add_card(pd, deck)
  pd[:hand] << deck.pop
  pd[:total] += VALUES[pd[:hand].last[0..-2].to_s]
  aces_correct(pd)
  pd[:cards] += 1
end

def aces_correct(pd)
  pd[:total] -= 10 if pd[:total] > 21 && pd[:hand].last.start_with?('A')
end

def calc_win(ply, del)
  return false if ply[:busted] == true
  return true if del[:busted] == true
  return false if del[:total] > ply[:total]
  true
end

def display_win(ply, del)
  msg = calc_win(ply, del) ? 'won' : 'lost'
  del_msg = del[:busted] ? 'busted with' : 'got'
  puts ">> Ah, rats! You're busted. You took too many cards." if ply[:busted]
  puts ">> You #{msg}!! The dealer #{del_msg} #{del[:total]} points " \
  "and their hand was #{del[:hand].join(' - ')}."
end

def again?
  puts ">> Would you like to play again? 'yes' or 'no':"
  choice = gets.chomp
  again = choice.downcase.start_with?('y') ? true : false
  if again
    puts ">> Alright! Let's go for another round, matey!"
    sleep(2.2)
  end
  again
end

def player_turn(ply, del, deck)
  loop do
    puts ">> Right now, your deck is #{ply[:hand].join(' - ')} " \
    "and the dealer has a #{del[:hand].first}."
    puts ">> That means you've got #{ply[:total]} points " \
    "and #{ply[:cards]} cards."
    puts ">> Will you 'hit' or 'stay'?"
    choice = gets.chomp
    break if choice.downcase.start_with?('s')
    add_card(ply, deck)
    if ply[:total] > 21
      ply[:busted] = true
      break
    end
  end
end

def dealer_turn(ply, del, deck)
  puts ">> It's the dealer's turn..."
  until del[:total] >= 17 || ply[:busted] == true
    puts ">> Dealer hits!"
    add_card(del, deck)
  end
  del[:busted] = true if del[:total] > 21
end

loop do
  system 'clear'
  puts ">> Welcome to Twenty-One! Press enter to begin:"
  gets

  player = { total: 0, busted: false, cards: 0, hand: [] }
  dealer = { total: 0, busted: false, cards: 0, hand: [] }
  deck = VALUES.keys.product(SUITS).map(&:join).shuffle

  2.times do
    add_card(player, deck)
    add_card(dealer, deck)
  end

  player_turn(player, dealer, deck)
  dealer_turn(player, dealer, deck) if player[:busted] == false

  calc_win(player, dealer)
  display_win(player, dealer)

  break unless again?
end

puts '>> Thanks for playing Twenty-One! Have a good one!'
