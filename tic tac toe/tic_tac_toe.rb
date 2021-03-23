class TicTacToe
  @@winning_set = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  def initialize
    @board = (1..9).to_a
    @game_over = false
    @moves_1 = []
    @moves_2 = []
    @i = 0
  end

  def print_board
    puts "\t #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "\t---+---+---\n"
    puts "\t #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "\t---+---+---\n"
    puts "\t #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def check_result(name, symbol)
    final_1 = []
    final_2 = []
    if symbol == "X"
      @@winning_set.each do |ar|
        if (@moves_1.include? ar[0]) && (@moves_1.include? ar[1]) && (@moves_1.include? ar[2])
          final_1 << "Y"
        else
          final_1 << "N"
        end
      end
      if final_1.include? "Y"
        print "Player 1, #{name} Won!!" 
        @game_over = true
      end
    elsif symbol == "O"
      @@winning_set.each do |ar|
        if (@moves_2.include?ar[0]) && (@moves_2.include?ar[1]) && (@moves_2.include?ar[2])
          final_2 << "Y"
        else
          final_2 << "N"
        end
      end
      if final_2.include? "Y"
        print "Player 2, #{name} Won!!" 
        @game_over = true 
      end
    else
      print "Draw" if @i == 8
    end
  end

  def moves(name, symbol)
    print "Enter the tile number to replace with #{symbol}: "
    position = gets.chomp.to_i
    if symbol == "X"
      until position.to_s.match(/[1-9]/) && !(@moves_1.include?(position)) do
        print "Invalid position or Already taken. Enter again: "
        position = gets.chomp.to_i
      end
      @moves_1 << position
    else
      until position.to_s.match(/[1-9]/) && !(@moves_2.include?(position)) do
        print "Invalid position or Already taken. Enter again: "
        position = gets.chomp.to_i
      end
      @moves_2 << position
    end

    @board[position - 1] = symbol
    self.print_board
    self.check_result(name, symbol)
  end
  
  def new_game
    print "Enter name of Player 1 (with 'X' symbol): "
    @player_1 = gets.chomp
    @p1_sym = "X"
    print "Enter name of Player 2 (with 'O' symbol): "
    @player_2 = gets.chomp
    @p2_sym = "O"
    puts "\nPlayer #{@player_1} goes first.\n\n"
    self.print_board
    while @i < 9 && @game_over == false
      if @i.even?
        self.moves(@player_1, @p1_sym)
      else
        self.moves(@player_2, @p2_sym)
      end
      @i += 1
    end
    print "\n\nDo you want to play again?(y/n): "
    restart = gets.chomp
    new_game if restart == 'y'
  end
end
puts "\tLets play tic-tac-toe "
game = TicTacToe.new
game.new_game