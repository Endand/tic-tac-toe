class GameBoard
  def initialize
    puts 'Game Board created'
    #makes 2D gameboard
  end

  #method to display gameboard
  #method to mark a cell
  #method to check for a win
  
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

  #method for making a move
end

class TicTacToe
  #manage overall game flow
  #manage player turn
  #check for win or draw
  def initialize
    puts "Play Tic Tac Toe!\n\n"

    print 'Enter Player1 Name: '
    @player1 = Player.new(gets.chomp.capitalize, 'O')
    print 'Enter Player2 Name: '
    @player2 = Player.new(gets.chomp.capitalize, 'X')

    puts "\nWelcome #{@player1.name} and #{@player2.name}!"

    play_game
  end

  def play_game
    game_result=''
    turn=0
    while game_result != 'win' and game_result!='draw'
    
      player = (turn.even? ? @player1 : @player2)

      p player.symbol

      if turn==4 
        game_result='win'
      end 

      turn+=1

    end

  end
end

game = TicTacToe.new