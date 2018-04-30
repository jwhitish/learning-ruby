require "methods"

describe "greeter" do
  context "given a name" do
    it "returns 'Hello (name)'" do
      expect(greeter("Jacob")).to eql("Hello Jacob")
    end
  end
end

describe "by_three?" do
  context "given a number" do
    it "returns true or false if the number is divisible by three" do
      expect(by_three?(6)).to eql(true)
    end
  end
end
