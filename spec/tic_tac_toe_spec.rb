require "tic_tac_toe"

describe TicTacToe do
  describe ".new" do
    it "accepts nil for the game board" do
      expect(TicTacToe.new).to_not be_nil
    end

    it "accepts a 3x3 two dimensional array" do
      board = [[0,0,0],[0,0,0],[0,0,0]]

      expect(TicTacToe.new(board)).to_not be_nil
    end

    it "accepts a 4x4 two dimensional array" do
      board = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
 
      expect(TicTacToe.new(board)).to_not be_nil
    end

    it "raises an error at a 3x4 two dimensional array" do
      board = [[0,0,0,0],[0,0,0,0],[0,0,0,0]]
 
      expect {TicTacToe.new(board)}.to raise_error(StandardError, "Only square game boards allowed")
    end
  end

  describe "#solve" do
    it "shows a draw for an unstarted game" do
      game = TicTacToe.new
      expect(game.solve).to eq "draw"
    end
  end
end