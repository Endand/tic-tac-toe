class GameBoard
  # represent gameboard as 2D array
  def initialize
    @game_board = Array.new(3) { Array.new(3) {" "} }
  end

  # method to display gameboard
  def display
    @game_board.each_with_index do |row,rindex|
      row.each_with_index do |col,cindex|
        print "|" unless cindex==0
        print @game_board[rindex][cindex]
      end
      
      puts
      puts "-+-+-" unless rindex == 2
    end
    puts
  end
  # method to mark a cell
  def mark_cell(row,col,symbol)
    @game_board[row][col] = symbol if @game_board[row][col]==" "
  end


  # method to check for a win
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

    @game_board = GameBoard.new

    play_game
  end

  def play_game
    game_result = ''
    turn = 0
    while game_result != 'win' and game_result != 'draw'

      player = (turn.even? ? @player1 : @player2)

      @game_board.display

      @game_board.mark_cell(0,0,player.symbol)

      @game_board.display

      if turn == 0
        game_result = 'win'
      end

      turn += 1

    end
  end
end

game = TicTacToe.new



