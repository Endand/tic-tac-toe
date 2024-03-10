class GameBoard
  def initialize
    puts 'Game Board created'
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
end

class TicTacToe
  def initialize
    puts "Play Tic Tac Toe!\n\n"

    print 'Enter Player1 Name: '
    player1 = Player.new(gets.chomp.capitalize, 'O')
    print 'Enter Player2 Name: '
    player2 = Player.new(gets.chomp.capitalize, 'X')

    puts "\nWelcome #{player1.name} and #{player2.name}!"
  end
end

game = TicTacToe.new