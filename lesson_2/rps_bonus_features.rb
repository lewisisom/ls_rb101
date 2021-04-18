ROCK_PAPER_SCISSORS = %w(rock paper scissors lizard spock)
R_P_S_L_SP = %w(r p s l sp)

def prompt(message)
  puts "=> #{message}"
end

def win(first, second)
  (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'rock' && second == 'scissors')
end

def display_results(player, computer)
  if win(player, computer)
    prompt 'You won!'
  elsif win(computer, player)
    prompt 'Computer wins!'
  else
    prompt "It's a tie!"
  end
end

choice = ''
computer_choice = ''

loop do
  loop do
    prompt "Choose one: #{ROCK_PAPER_SCISSORS.join(', ')}.
   You can also just type 'r', 'p', 's', 'l', 'sp'."
    choice = gets.chomp
    if R_P_S_L_SP.include?(choice)
      choice = ROCK_PAPER_SCISSORS[R_P_S_L_SP.index(choice)]
    end
    break if ROCK_PAPER_SCISSORS.include?(choice)
    prompt 'Please enter a valid input.'
    next
  end

  computer_choice = ROCK_PAPER_SCISSORS.sample
  prompt "You chose #{choice} and the computer chose #{computer_choice}..."
  prompt '-----------------------------------------------------'

  display_results(choice, computer_choice)

  prompt "Would you like to play again? ('yes'/'no')"
  play_again = gets.chomp
  break unless play_again.downcase == 'yes'
  next
end

prompt "Game over. You won #{player_wins} times, the computer won #{computer_wins} times, and there were #{ties} ties."
prompt 'Thanks for playing!'
