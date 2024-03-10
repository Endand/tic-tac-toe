class GameBoard
  # represent gameboard as 2D array
  def initialize
    @game_board = Array.new(3) { Array.new(3) { " " } }
  end

  # method to display gameboard
  def display
    @game_board.each_with_index do |row, rindex|
      row.each_with_index do |col, cindex|
        print " |" unless cindex == 0
        print @game_board[rindex][cindex]
      end

      puts
      puts "--+--+--" unless rindex == 2
    end
    puts
  end

  # method to mark a cell
  def mark_cell(row, col, symbol)
    @game_board[row][col] = symbol if @game_board[row][col] == " "
  end

  # method to check for a win
  def check_result
    # check if there is a winner

    # checks for rows
    if @game_board.any? { |row| row.uniq.length == 1 && row[0] != ' ' }
      return 'win'

    # checks for cols
    elsif @game_board.transpose.any? { |col| col.uniq.length == 1 && col[0] != ' ' }
      return 'win'

    # check diagonals
    elsif check_diagonal('O') || check_diagonal('X')
      return "win"

    end

    # since there isn't a winner and board is full, it's a tie
    if @game_board.all? { |row| row.all? { |element| element != ' ' } }
      'draw'
    end
  end

  def check_diagonal(symbol)
    winning_combos = [
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [2, 0]],
    ]

    winning_combos.each do |combination|
      return true if combination.all? { |spot_row, spot_col| @game_board[spot_row][spot_col] == symbol }
    end
    false
  end

  def can_put?(row, col)
    @game_board[row][col] == ' '
  end

  def reset_board
    @game_board = Array.new(3) { Array.new(3) { " " } }
  end
end

class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def name
    @name
  end

  def symbol
    @symbol
  end

  # method for making a move
  def make_move
    puts "Your Turn #{@name}"
    puts
    row = nil
    col = nil
    loop do
      print 'Select Row (0, 1, or 2): '
      row = gets.chomp.to_i
      break if (0..2).include?(row)

      puts 'Invalid input. Please enter 0, 1, or 2.'
    end

    loop do
      print 'Select Column (0, 1, or 2): '
      col = gets.chomp.to_i
      break if (0..2).include?(col)

      puts 'Invalid input. Please enter 0, 1, or 2.'
    end

    puts

    return row, col
  end
end

class TicTacToe
  # manage overall game flow
  # manage player turn
  # check for win or draw
  def initialize
    puts "Play Tic Tac Toe!\n\n"

    print 'Enter Player1 Name: '
    @player1 = Player.new(gets.chomp.capitalize, 'O')
    print 'Enter Player2 Name: '
    @player2 = Player.new(gets.chomp.capitalize, 'X')

    puts "\nWelcome #{@player1.name} and #{@player2.name}!"
    puts

    @game_board = GameBoard.new
    play_game(0)
  end

  def play_game(game_num)
    times_played = game_num
    game_result = ''
    winner = nil
    turn = times_played
    while game_result != 'win' and game_result != 'draw'

      player = (turn.even? ? @player1 : @player2)

      show_curr_state

      row = nil
      col = nil

      loop do
        (row, col) = player.make_move
        break if @game_board.can_put?(row, col)

        puts "That spot is already taken. Please choose another spot.\n"
        show_curr_state
      end

      @game_board.mark_cell(row, col, player.symbol)

      game_result = @game_board.check_result

      winner = player if game_result == 'win'

      turn += 1

    end
    @game_board.display
    if game_result == 'win'
      puts "Congrats #{winner.name}, you won!"
    else
      puts "It's a draw!"
    end

    puts
    play_again = ''
    loop do
      print "Do you want to play a new game with the same person? \nPlayer order will change. \n(Y/N)"
      play_again = gets.chomp.downcase
      break if ['y', 'n'].include?(play_again)

      puts 'Invalid input. Please enter Y or N.'
      puts
    end

    if play_again == 'y'
      times_played += 1
      puts
      @game_board.reset_board
      play_game(times_played)

    else
      puts "Thank you for playing!"
    end
  end

  def show_curr_state
    puts "Current Board State: "
    @game_board.display
  end
end

game = TicTacToe.new
