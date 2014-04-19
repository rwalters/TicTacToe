class TicTacToe
  class UnevenBoardError < StandardError
    def initialize(msg = "Only square game boards allowed")
      super
    end
  end

  class EmptyBoardError < UnevenBoardError
    def initialize(msg = "Board must be a two dimensional array")
      super
    end
  end

  class InvalidPlayersError < StandardError
    def initialize(msg = "Only 'X', 'O', or unmoved allowed")
      super
    end
  end

  DEFAULT_BOARD = [[0,0,0],[0,0,0],[0,0,0]]
  PLAYERS = ["", "O", "X"]
  Y = 1
  X = 2

  def initialize(board = DEFAULT_BOARD)
    raise EmptyBoardError     if board.empty?
    raise InvalidPlayersError unless board.flatten.reject{|cell| PLAYERS[cell]}.empty?

    @game_board        = board.clone
    @transposed_board  = transpose(@game_board)
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
    transposed_board = board.transpose
    raise UnevenBoardError unless board.length == transposed_board.length
    transposed_board
  rescue IndexError
    raise UnevenBoardError
  end
end