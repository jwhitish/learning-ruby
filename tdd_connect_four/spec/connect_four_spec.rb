require "connect_four"

describe Game do
  before do
    @game = Game.new
  end

  describe "#welcome" do
    context "when beginning a new game" do
      it "prints a welcome message" do
        expect{ @game.welcome }.to output("Welcome to connect four!\n").to_stdout
      end
    end
  end

  describe "#menu" do
    context "when called" do
      it "prints menu options" do
        expect{ @game.menu }.to output("Select an option:\n\n1) New Game\n\n2)Quit\n").to_stdout
      end
      it "gets user input" do
        allow($stdin).to receive(:gets).and_return('1')
        expect{ @game.menu }.to respond_to($stdin)
        #check if it accepted user input
      end
      it "if 1 launches a new game" do
        #launch a new game
      end
      it "if 2 quits the program" do
        #quit the program
      end
    end
  end

end
