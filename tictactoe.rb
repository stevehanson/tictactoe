# simple tic tac toe game to demonstrate SRP principles

class TicTacToe

  def initialize
    @board = Array.new(3) {
      Array.new(3) { ' ' }
    }
    @current_player = 'x'
  end

  def play_turn(row, col)
    @board[row][col] = @current_player
    print_board
    check_winner
    toggle_player
  end

  def toggle_player
    @current_player = (@current_player=='x') ? 'o' : 'x'
  end

  def print_board
    @board.each do |row|
      puts row.join(' ')
    end
  end

  def check_winner
    if(rows_winner? or cols_winner?) then
      puts @winner + ' wins!!'
    end
  end

  def rows_winner?
    all_equal_in_group?(@board)
  end

  def cols_winner?
    all_equal_in_group?(@board.transpose)
  end

  def all_equal_in_group?(groups)
    groups.each do |group|
      if(group[0] != ' ' and group.uniq.length == 1) then
        @winner = group[0]
        return true
      end
    end
    false
  end

end
