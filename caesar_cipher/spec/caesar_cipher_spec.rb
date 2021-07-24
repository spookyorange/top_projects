require './lib/caesar_cipher.rb'

describe ".caesar_cipher" do
  it "takes a word and changes it to coded version" do
    expect(caesar_cipher('haha', 2)).to eql('jcjc')
  end
  it "takes 2 words with a space between em and gives 2 words with space between them once more" do
    expect(caesar_cipher('haha haha', 2)).to eql('jcjc jcjc')
  end
  it "takes last and gets back to the beginning of the alphabet" do
    expect(caesar_cipher('zaha zaha', 2)).to eql('bcjc bcjc')
  end
  it "can be usable with capital letters" do 
    expect(caesar_cipher('zAha ZaHa', 2)).to eql('bCjc BcJc')
  end
end