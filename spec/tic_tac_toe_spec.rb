require "tic_tac_toe"

describe TicTacToe do
  let(:board3x3)        { [[0,1,1],[2,2,2],[0,0,0]] }
  let(:board4x4)        { [[2,1,2,2],[2,1,0,0],[0,1,0,0],[0,1,0,0]] }
  let(:board3x4)        { [[0,0,0,0],[0,0,0,0],[0,0,0,0]] }
  let(:board_staggered) { [[0,0,0],[0,0,0,0],[0,0]] }

  describe ".new" do
    it "accepts nil for the game board" do
      expect(TicTacToe.new).to_not be_nil
    end

    it "accepts a 3x3 two dimensional array" do
      expect(TicTacToe.new(board3x3)).to_not be_nil
    end

    it "accepts a 4x4 two dimensional array" do
      expect(TicTacToe.new(board4x4)).to_not be_nil
    end

    it "raises an error at a 3x4 two dimensional array" do
      expect {TicTacToe.new(board3x4)}.to raise_error(TicTacToe::UnevenBoardError, "Only square game boards allowed")
    end

    it "raises an error at a staggered two dimensional array" do
      expect {TicTacToe.new(board_staggered)}.to raise_error(TicTacToe::UnevenBoardError, "Only square game boards allowed")
    end
  end

  describe "#find_winner" do
    it "shows a draw for an unstarted game" do
      game = TicTacToe.new
      expect(game.find_winner).to eq "draw"
    end

    it "shows X as the winner when X wins a row" do
      expect(TicTacToe.new(board3x3).find_winner).to eq "X"
    end

    it "shows O as the winner when O wins a column" do
      expect(TicTacToe.new(board4x4).find_winner).to eq "O"
    end
  end
end