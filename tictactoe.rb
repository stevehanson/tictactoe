# original

class TicTacToe

  attr_reader :board

  def initialize
    @board = Array.new(3) {
      Array.new(3) { ' ' }
    }
    @current_player = 1
  end

  def play_turn(square)
    @board[square[0]][square[1]] = (@current_player == 1) ? 'x' : 'o'
    @current_player = (@current_player==1) ? 0 : 1
    print_board
    check_winner
  end

  def print_board
    @board.each do |row|
      row.each do |cell|
        print cell + ' '
      end
      puts
    end
  end

  def check_winner
    result = check_rows
    if(result) then
      puts result + ' wins!!'
    end
    result = check_columns
    if(result) then
      puts result + ' wins!!'
    end
  end

  def check_rows
    @board.each do |(x,y,z)|
      if(x!=' ' && x == y && x == z) then
        return x
      end
    end
    return false
  end

  def check_columns
    (0..2).each do |n|
      if(@board[0][n] != ' ' && @board[0][n] == @board[1][n] && @board[0][n] == @board[2][n]) then
        return @board[n][0]
      end
    end
    return false
  end

end
