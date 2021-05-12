INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def display_board(brd)
  system 'clear'
  prompt "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "                 "
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "_____|_____|_____"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "_____|_____|_____"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts "                 "
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(brd, delimiter = ', ', final_word = 'or')
  case brd.size
  when 0 then ''
  when 1 then brd.first.to_s + '.'
  when 2 then brd.join(" #{final_word} ") + '.'
  when 3..9 then brd[0..-2].join(delimiter) +
    "#{delimiter + final_word} #{brd[-1]}."
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_move!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'Invalid input! Please make a choice from the remaining squares.'
  end
  brd[square] = PLAYER_MARKER
end

def computer_move!(brd)
  if almost_win?(brd, COMPUTER_MARKER)
    square = computer_move_location(brd, COMPUTER_MARKER)
  elsif almost_win?(brd, PLAYER_MARKER)
    square = computer_move_location(brd, PLAYER_MARKER)
  elsif brd[5] == ' '
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def almost_win?(brd, mkr)
  WINNING_LINES.each do |line|
    return true if brd.values_at(*line).count(mkr) == 2 &&
                   brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  false
end

def computer_move_location(brd, mkr)
  location_line = []
  location_point = nil

  WINNING_LINES.select do |line|
    location_line << (brd.values_at(*line).count(mkr) == 2 &&
                      brd.values_at(*line).count(INITIAL_MARKER) == 1)
  end
  location_line = WINNING_LINES[location_line.index(true)]

  location_point = location_line[0] if brd[location_line[0]] == ' '
  location_point = location_line[1] if brd[location_line[1]] == ' '
  location_point = location_line[2] if brd[location_line[2]] == ' '

  location_point
end

def win?(brd)
  if detect_winner(brd) == 'Player' || detect_winner(brd) == 'Computer'
    return true
  end
  false
end

def full_board?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def update_score(scr, brd)
  case detect_winner(brd)
  when 'Player' then scr[:player] += 1
  when 'Computer' then scr[:computer] += 1
  when nil then scr[:ties] += 1
  end
end

def welcome
  system 'clear'
  prompt "Welcome to Tic-Tac-Toe! Get three in a row to win a match. " \
         "Gather 5 wins to win the whole game!"
  prompt "The numbering of the grid looks like this: _1_|_2_|_3_
                                              _4_|_5_|_6_
                                               7 | 8 | 9"
  prompt "You will be playing against a computer."
  prompt "Half of rounds, you get to choose who goes first, "
  prompt "and the other half, the computer will randomly choose who goes first."
  prompt "Press the enter key whenever you're ready to start playing."
  gets
end

def go_first?
  turn_picker = [1, 2].sample

  if turn_picker == 1
    prompt "Who should go first this round? Enter 'p' for player (you), " \
    "and 'c' for the computer:"
    goes_first = gets.chomp
  else
    prompt "The computer will randomly select who will go first..."
    goes_first = ['You', 'Computer'].sample
    prompt "#{goes_first} will go first."
    sleep(3)
  end

  goes_first.downcase.start_with?('c')
end

score = { player: 0, computer: 0, ties: 0 }

welcome

loop do
  loop do
    board = initialize_board

    computer_move!(board) if go_first?

    loop do
      display_board(board)

      player_move!(board)
      break if win?(board) || full_board?(board)

      computer_move!(board)
      break if win?(board) || full_board?(board)
    end

    display_board(board)

    if win?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    update_score(score, board)
    prompt "The current score is: #{score[:player]} wins, " \
           "#{score[:computer]} loses, and #{score[:ties]} ties."
    prompt "Press the enter key to move on to the next match!"
    gets
    break if score.values_at(:player, :computer).max >= 5
  end

  if score.fetch(:player) >= 5
    prompt "You got 5 matches and won the whole game. Good job!"
  else
    prompt "The computer got 5 matches and won the game. Better luck next time."
  end

  prompt "Do you want to play again? Type 'y' or 'n'."
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end

prompt 'Game over. Thanks for playing Tic-Tac-Toe!'
