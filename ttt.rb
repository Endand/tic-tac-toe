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
    game = GameBoard.new

    player1 = Player.new(gets.chomp.capitalize, 'O')
    player2 = Player.new(gets.chomp.capitalize, 'X')

    puts "Welcome #{player1.name}!"
  end
end

game = TicTacToe.new