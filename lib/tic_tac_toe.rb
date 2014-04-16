class TicTacToe
  class UnevenBoardError < StandardError
    def initialize(msg = "Only square game boards allowed")
      super
    end
  end

  DEFAULT_BOARD = [[0,0,0],[0,0,0],[0,0,0]]
  PLAYERS = ["", "O", "X"]

  def initialize(board = DEFAULT_BOARD)
    @game_board = board.clone
    @transposed_board = transpose(@game_board)
    raise UnevenBoardError unless @game_board.length == @transposed_board.length
  end

  def find_winner
    winner = "draw"
    winner = find_winner_by_row
    winner = find_winner_by_column    if winner == "draw"
    winner = find_winner_by_diagonal  if winner == "draw"
    return winner
  end

  private
  def find_winner_by_row
    return find_winning_row(@game_board)
  end

  def find_winner_by_column
    return find_winning_row(@transposed_board)
  end

  def find_winner_by_diagonal
    winner = "draw"
    winner = find_winning_row(ascending_diagonal)
    winner = find_winning_row(descending_diagonal) if winner == "draw"
    return winner
  end

  def find_winning_row(game_board)
    winner = "draw"
    game_board.each do |row|
      initial_cell = row[0]
      next if initial_cell == 0

      winner = PLAYERS[initial_cell]

      row.each do |cell|
        winner = "draw" unless cell == initial_cell
      end

      break unless winner == "draw"
    end

    return winner
  end

  def ascending_diagonal
    return diagonal(@game_board)
  end

  def descending_diagonal
    return diagonal(@game_board.reverse)
  end
  
  def diagonal(board)
    diagonal = []
    board.each_with_index do |row, i|
      diagonal << row[i]
    end

    return [diagonal]
  end

  def transpose(board)
    board.transpose
  rescue IndexError
    raise UnevenBoardError
  end
end