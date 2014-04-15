class TicTacToe
  DEFAULT_BOARD = [[0,0,0],[0,0,0],[0,0,0]]

  def initialize(board = DEFAULT_BOARD)
    raise StandardError, "Only square game boards allowed" unless board.length == board.transpose.length
    @game_board = board.clone
  end

  def solve
    return "draw"
  end
end