# refactored to have board class

class Board

  attr_reader :row_count, :col_count

  def initialize(rows, columns)
    @row_count = rows
    @col_count = columns
    @board = Array.new(rows) {
      Array.new(columns) { ' ' }
    }
  end

  def update(row, column, value)
    @board[row][column] = value
  end

  def rows
    @board
  end

  def cols
    @board.transpose
  end

  def get(row, col)
    @board[row][col]
  end

  def to_s
    s = ''
    @board.each do |row|
      s += row.join(' ') + "\n"
    end
    s
  end

end


class TicTacToe

  def initialize
    @board = Board.new(3, 3)
    @current_player = 'x'
    @winner = ''
  end

  def play_turn(row, column)
    @board.update(row, column, @current_player)
    puts @board.to_s
    check_winner
    toggle_player
  end

  def toggle_player
    @current_player = (@current_player=='x') ? 'o' : 'x'
  end

  def check_winner
    if(rows_winner? or cols_winner?) then
      puts @winner + ' wins!!'
    end
  end

  def rows_winner?
    all_equal_in_group?(@board.rows)
  end

  def cols_winner?
    all_equal_in_group?(@board.cols)
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
