# Write out a description of the game Tic-Tac-Toe:

# Tic-Tac-Toe is a two-player short childrens' game where
# two players take turns putting down X's or O's on a 3x3 grid.
# The 3x3 playing field starts out empty at the beginning of a match,
# and the match ends if there are three X's or O's in a row, column,
# or diagonal. The winner is the one with 3 of their symbol in
# a straight line. If the entire playing grid of 9 squares is filled,
# then the outcome is a tie. No one wins or loses that round.
# The first player writes down the X's, and the
# second player writes down the O's. The two players can play
# as many matches as they wish.
# _|_|_ <- This is what the game board looks like at the
# _|_|_    beginning of a match.
#  | |     As the match goes on, the game board gets filled with X and O.

# Flow chart of sequences:

# 1. Have a welcome message and breifly go over the rules of the game.
# 2. Ask the user if they would like to go first or second.
# 3. If user chose first, go to step 4. If second, go to step 5.
# 4. Show the playing field and ask the user to choose a square.
# 5. Make a move for the computer (other player).
# 6. Show the current playing field with the new moves.
# 7. Check for a win/tie. If there is no win/tie, go to step 3.
# 8. Determine the win state and show a winning message to the user.
# 9. Ask the user if they would like to play another match.
# 10. If they do, reset the playing board and go to step 2.
# 11. Have a goodbye message, 'thanks for playing'. End the program.

# But how exactly will each step work? Some of the steps are quite complex.
# (Move to ttt_walkthrough.rb)
