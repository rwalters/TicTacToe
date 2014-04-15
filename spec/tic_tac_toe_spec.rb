require "tic_tac_toe"

describe TicTacToe do
  describe "#solve" do
    it "shows a draw for an unstarted game" do
      game = TicTacToe.new
      expect(game.solve).to eq "draw"
    end
  end
end