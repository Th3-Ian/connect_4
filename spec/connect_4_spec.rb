require "./lib/connect_4.rb"


describe "GameBoard" do 
  describe "#turn_counter" do
    it "increases turn by 1" do
      turn = double("turn")
      allow(turn).to receive(:turn_counter) { +1 }
      expect(turn.turn_counter).to eq(1)
    end

    it "ends game if turn reaches 42" do
      turn = double("turn")
      allow(turn).to receive(:turn_counter) { 41 + 1 }
      expect(turn.turn_counter).to eq(42)
    end
  end

  describe "#display_grid" do
    it "displays grid" do
      grid = double('grid')
      allow(grid).to receive(:board) { "Board Show" }
      expect(grid.board).to eql("Board Show")
    end
  end

  describe "#win" do
    before(:each) do
      grid = double('grid')
    end
    board = GameBoard.new
    it "wins diagonal left to right" do
      
      board = @board.instance_variable_set(@board, [["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "_", "_", "_", "_", "_"],
                                      ["X", "_", "_", "_", "_", "_", "_"],
                                      ["X", "X", "_", "_", "_", "_", "_"],
                                      ["X", "O", "X", "_", "_", "_", "_"],
                                      ["X", "O", "X", "X", "_", "_", "_"]])

      expect(board.vert_win).to eql("X")

    end

    xit "wins diagonal right to left" do
      allow(grid).to receive(:board) { [["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "_", "_", "_", "_", "_"],
                                      ["X", "_", "_", "_", "_", "_", "_"],
                                      ["O", "X", "_", "_", "_", "_", "_"],
                                      ["O", "O", "X", "_", "_", "_", "_"],
                                      ["O", "O", "X", "X", "_", "_", "_"]] }
      expect(grid.board).to eql("Board Show")

    end

    xit "wins horizontal" do
      allow(grid).to receive(:board) { [["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "_", "_", "_", "_", "_"],
                                      ["X", "_", "_", "_", "_", "_", "_"],
                                      ["O", "X", "_", "_", "_", "_", "_"],
                                      ["O", "O", "X", "_", "_", "_", "_"],
                                      ["O", "O", "X", "X", "_", "_", "_"]] }
      expect(grid.board).to eql("Board Show")

    end

    xit "wins verticle" do
      allow(grid).to receive(:board) { [["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "_", "_", "_", "_", "_"],
                                      ["X", "_", "_", "_", "_", "_", "_"],
                                      ["O", "X", "_", "_", "_", "_", "_"],
                                      ["O", "O", "X", "_", "_", "_", "_"],
                                      ["O", "O", "X", "X", "_", "_", "_"]] }
      expect(grid.board).to eql("Board Show")

    end
  end

  describe "#tie?" do
    before(:each) do
      grid = double('grid')
    end

    xit "returns board full true" do
      allow(grid).to receive(:board) { [["O", "O", "X", "X", "O", "O", "X"],
                                      ["O", "O", "X", "X", "O", "O", "X"],
                                      ["X", "O", "O", "X", "X", "O", "X"],
                                      ["O", "X", "O", "O", "X", "X", "O"],
                                      ["O", "O", "X", "O", "O", "X", "X"],
                                      ["O", "O", "X", "X", "O", "O", "X"]] }
      expect(grid.board).to eql("Board Show")
    end

    xit "returns board full false" do
      allow(grid).to receive(:board) { [["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "_", "_", "_", "_", "_"],
                                      ["X", "_", "_", "_", "_", "_", "_"],
                                      ["O", "X", "_", "_", "_", "_", "_"],
                                      ["O", "O", "X", "_", "_", "_", "_"],
                                      ["O", "O", "X", "X", "_", "_", "_"]] }
      expect(grid.board).to eql("Board Show")

    end
  end

  describe "#drop_piece" do

    xit "piece dropped in 3rd column" do
      grid = double('grid')
      allow(grid).to receive(:drop_piece) { [["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "_", "_", "_", "_", "_"],
                                      ["_", "_", "X", "_", "_", "_", "_"]] }
      ans = grid.drop_piece
      ans.should match( [["_", "_", "_", "_", "_", "_", "_"],
                      ["_", "_", "_", "_", "_", "_", "_"],
                      ["_", "_", "_", "_", "_", "_", "_"],
                      ["_", "_", "_", "_", "_", "_", "_"],
                      ["_", "_", "_", "_", "_", "_", "_"],
                      ["_", "_", "X", "_", "_", "_", "_"]] )
    end
  end

  describe "#valid_move?" do
    xit "not valid" do
    end

    xit "returns valid" do
    end
  end
end