require "caesar_cipher"

describe "Cipher" do

  describe ".caesar_cipher" do
    context "given a letter and a key" do
      it "returns a letter shifted by that key" do
        expect(Cipher.caesar_cipher("a",5)).to eql("f")
      end
    end
    context "given a space" do
      it "returns a space" do
        expect(Cipher.caesar_cipher(" ",5)).to eql(" ")
      end
    end
    
  end
end
