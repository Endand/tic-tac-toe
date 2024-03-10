class GameBoard
  # represent gameboard as 2D array
  def initialize
    @game_board = Array.new(3) { Array.new(3) { " " } }
  end

  # method to display gameboard
  def display
    @game_board.each_with_index do |row, rindex|
      row.each_with_index do |col, cindex|
        print "|" unless cindex == 0
        print @game_board[rindex][cindex]
      end

      puts
      puts "-+-+-" unless rindex == 2
    end
    puts
  end

  # method to mark a cell
  def mark_cell(row, col, symbol)
    @game_board[row][col] = symbol if @game_board[row][col] == " "
  end

  # method to check for a win
  def check_result
    'draw'
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

    play_game
  end

  def play_game
    game_result = ''
    turn = 0
    winner = nil
    while game_result != 'win' and game_result != 'draw'

      player = (turn.even? ? @player1 : @player2)

      puts "Current Board State: "
      puts
      @game_board.display

      (row, col) = player.make_move

      @game_board.mark_cell(row, col, player.symbol)

      # check and break if win condition met
      game_result = @game_board.check_result

      winner = player if game_result == 'win'

      turn += 1 unless game_result == 'win'

    end

    if game_result=='win'
      puts "Congrats #{winner.name}, you won!"
    else
      puts "It's a draw!"
    end
  end
end

game = TicTacToe.new
