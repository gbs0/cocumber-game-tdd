require_relative '../lib/bag_of_words'

RSpec.describe BagOfWords do
  it "is possible to put words on it" do
    bag = BagOfWords.new

    bag.put("hello", "world")

    expected = (bag.words.size == 2)
    expect(expected).to be_truthy
  end
end