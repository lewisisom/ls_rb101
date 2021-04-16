ROCK_PAPER_SCISSORS = %w(rock paper scissors)

def test_method
  prompt 'test'
end

def prompt(message)
  puts "=> #{message}"
end

def win(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
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
    prompt "Choose one: #{ROCK_PAPER_SCISSORS.join(', ')}"
    choice = gets.chomp
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
prompt 'Thanks for playing!'
