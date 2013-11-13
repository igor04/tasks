require './reverse'


describe "reverse - 1" do
  it "should reverse array" do
    a = (1..10).to_a
    expect(reverse_1(a)).to eq a.reverse
  end
end

describe "reverse - 2" do
  it "should reverse array" do
    a = (1..10).to_a
    expect(reverse_2(a)).to eq a.reverse
  end

  it "should work without 'stack level too deep'" do
    a = (1..100_000).to_a
    expect(reverse_2(a)).to eq a.reverse
  end
end
