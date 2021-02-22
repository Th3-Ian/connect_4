#./lib/connect_4.rb

class Player
  attr_reader :name, :sym

  def initialize(player_name, sym)
    @player_name = player_name
    @sym = sym
  end
end

class GameBoard
  attr_accessor :board

  def initialize()
    @board = Array.new(6) {Array.new(7, "_")}
  end


  def display_board()
    @board.each do |row| 
      puts "|" 
      row.each do |x|
        print "|"
        print " #{x} "
      end
    end
    print "|"
    puts "\n  1   2   3   4   5   6   7"
  end

  def valid_move(move)
    move_list = [1, 2, 3, 4, 5, 6, 7]
    if move_list.include?(move)
      column_full?(move)
    else
      puts "That input is not valid, please enter 1-7:"
      Game.get_move()
    end
  end

  def player_turn(col, piece)
    row = 5
    until @board[row][col - 1] == "_"
      row -= 1
    end
    @board[row][col - 1] = piece
    display_board
  end

  def column_full?(ind)
    ind -= 1
    @board.each do |row|
      if row[ind].include?("_")
        return false
      else
        puts "Invalid Move: Row is full:"
        break
      end
    end
  end

  def winners()
    if [vert_win, hor_win, diag_left_win, diag_right_win, tie?].any?("X")
      puts "Congrats player 1 wins!!"
      exit
    elsif [vert_win, hor_win, diag_left_win, diag_right_win].any?("O")
      puts "Congrats player 2 wins!!"
      exit
    else
      return
    end
  end

  def hor_win()
    6.times do |row|
      4.times do |col|
        return "X " if [@board[row][col], @board[row][col + 1], @board[row][col + 2], @board[row][col + 3]].all?('X')
        return "O" if [@board[row][col], @board[row][col + 1], @board[row][col + 2], @board[row][col + 3]].all? { |i| i == 'O'}
       
      end
    end
  end

  def vert_win()
    3.times do |row|
      7.times do |col|
        return "X" if [@board[row][col], @board[row + 1][col], @board[row + 2][col], @board[row + 3][col]].all?("X")
        return "O" if [@board[row][col], @board[row + 1][col], @board[row + 2][col], @board[row + 3][col]].all?("O")
      end
    end
  end

  def diag_left_win()
    6.downto(3) do |y|
      3.upto(5) do |x|
        return 'X' if [@board[x][y], @board[x-1][y-1], @board[x-2][y-2], @board[x-3][y-3]].all?("X")
        return 'O' if [@board[x][y], @board[x-1][y-1], @board[x-2][y-2], @board[x-3][y-3]].all?("O")
      end
    end
  end

  def diag_right_win()
    6.downto(3) do |y|
      3.times do |x|
        return 'X' if [@board[x][y], @board[x+1][y-1], @board[x+2][y-2], @board[x+3][y-3]].all?("X")
        return 'O' if [@board[x][y], @board[x+1][y-1], @board[x+2][y-2], @board[x+3][y-3]].all?("O")
      end
    end
  end

  def tie?()
    if @turn ==  42
      puts "No more moves available. TIE GAME"
      exit
    end
  end
end


class Game
  def initialize()
    @player_1 = Player.new(gets.chomp, "X")
    @player_2 = Player.new(gets.chomp, "O")
    @turn = 1
    @active_game = GameBoard.new
  end

  def turn_counter()
    @turn += 1
  end

  def print_instructions
    puts <<-HEREDOC
      Hello! Welcome to Connect 4.
      In this game your goal is to connect four of your markers in a row.
      You can win vertically, horizontally or diagonally.
      Players must select a column from 1 - 7 and their marker will drop the last unfilled position.

      Good luck!

    HEREDOC
  end

  def start()
    print_instructions
    game_turn
  end

  def set_player()
    if @turn.odd?
      @current_player = @player_1
      p "player_1"
    else
      @current_player = @player_2
      p "player_2"
    end
  end

  def get_move()
    @active_game.display_board
    piece = @current_player.sym
    puts "Please choose a column to place your marker:"
    move = gets.chomp.to_i
    @active_game.valid_move(move)
    @active_game.player_turn(move, piece)
  end

  def game_turn()
    until @turn == 42 do
      set_player
      get_move
      GameBoard.winners
      turn_counter
    end
  end
end

new_game = Game.new

new_game.start
