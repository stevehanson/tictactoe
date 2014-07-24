# add win strategy

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

class RegularWinStrategy

  attr_reader :winner

  def has_winner(board)
    return rows_winner?(board) || cols_winner?(board)
  end

  def rows_winner?(board)
    all_equal_in_group?(board.rows)
  end

  def cols_winner?(board)
    all_equal_in_group?(board.cols)
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

class MiddleWinStrategy

  attr_reader :winner

  def has_winner(board)
    middle_val = board.get(board.row_count/2, board.col_count/2)
    if(!middle_val.strip.empty?) then
      @winner = middle_val
      return true
    end
    return false
  end
end

class TicTacToe

  def initialize(board, win_strategy)
    @board = board
    @current_player = 'x'
    @win_strategy = win_strategy
  end

  def play_turn(row, column)
    @board.update(row, column, @current_player)
    puts @board.to_s
    check_winner
    toggle_player
  end

  def check_winner
    if(@win_strategy.has_winner(@board)) then
      puts @win_strategy.winner + ' wins!!'
    end
  end

  def toggle_player
    @current_player = (@current_player=='x') ? 'o' : 'x'
  end

end
