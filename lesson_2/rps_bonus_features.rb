CHOICES = %w(rock paper scissors lizard spock)
CHOICES_SHORTENED = %w(r p s l sp)
WIN_SCORE = 5
WIN_RULES = { 'scissors': ['paper', 'lizard'],
              'paper': ['rock', 'spock'],
              'rock': ['lizard', 'scissors'],
              'lizard': ['spock', 'paper'],
              'spock': ['scissors', 'rock'] }

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if win?(player, computer)
    prompt 'You won!'
  elsif win?(computer, player)
    prompt 'Computer wins!'
  else
    prompt "It's a tie!"
  end
end

def win?(first, second)
  WIN_RULES[first.to_sym].include?(second)
end

def change_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  else
    score[:ties] += 1
  end
end

def welcome
  system('clear')
  prompt "Hello! Welcome to Rock-Paper-Scissors-Lizard-Spock!
    Defeat the computer #{WIN_SCORE} times to become the Champion!
    This is what beats what: Scissors -> Paper -> Rock -> Lizard ->
    Spock -> Scissors -> Lizard -> Paper -> Spock -> Rock -> Scissors."
  prompt "Press the enter key to begin!"
  gets
  system('clear')
end

choice = ''
computer_choice = ''
score = { player: 0, computer: 0, ties: 0 }

welcome

loop do
  loop do
    loop do
      prompt "Choose one: #{CHOICES.join(', ')}.
    You can also just type 'r', 'p', 's', 'l', 'sp'."
      choice = gets.chomp.downcase
      system('clear')
      if CHOICES_SHORTENED.include?(choice)
        choice = CHOICES[CHOICES_SHORTENED.index(choice)]
      end
      break if CHOICES.include?(choice)
      prompt 'Please enter a valid input. Do not include any whitespace.'
      next
    end

    computer_choice = CHOICES.sample
    prompt "You chose #{choice} and the computer chose #{computer_choice}...
  ~----------------------------------------------------~"
    sleep(1.2)

    display_results(choice, computer_choice)
    change_score(choice, computer_choice, score)
    prompt "Game over. You won this game! You are the Champion! Good job!!" if score[:player] >= WIN_SCORE
    prompt "Game over. The computer this game. Better luck next time!" if score[:computer] >= WIN_SCORE
    break if score[:player] >= WIN_SCORE || score[:computer] >= WIN_SCORE
    prompt "Current score is #{score[:player]} wins, #{score[:computer]} loses, and #{score[:ties]} ties. Next Round!"
    next
  end

  prompt "Would you like to play again? ('y'/'n')"
  play_again = gets.chomp
  break if play_again.downcase.start_with?('n')
  score = { player: 0, computer: 0, ties: 0 }
  system('clear')
  prompt "Alright let's do this again!"
  next
end

prompt "Hope you enjoyed my RPSLS game. Thanks for playing!"
