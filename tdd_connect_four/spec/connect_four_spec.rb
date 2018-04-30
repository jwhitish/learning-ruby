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
    before do
      io_obj = double
      expect(subject)
        .to receive(:gets)
        .and_return(io_obj)
      expect(io_obj)
        .to receive(:chomp)
        .and_return(:choice)
    end
    context "when called" do
      it "prints menu options" do
        expect{ @game.menu }.to output("Select an option:\n\n1) New Game\n\n2)Quit\n").to_stdout
      end
      it "gets user input" do
        subject.menu
        expect(subject.instance_variable_get(:@choice)).to eq :choice
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
