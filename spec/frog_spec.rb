require './frog'


shared_examples_for 'solution' do
  it "should find the shortest time where leaves is in position X with correct path" do
    a = [1, 3, 1, 4, 2, 3, 5, 4]
    expect(solution 5, a).to eq 6
  end

  it "should not pay attention for position without leaves" do
    a = [nil, 3, 1, 4, 2, nil, 5, 4]
    expect(solution 5, a).to eq 6
  end

  it "should find position only with correct path" do
    a = [1, 3, 1, nil, 2, 3, 5, 4, 5]
    expect(solution 5, a).to eq 8
  end

  it "should be -1 if in some position from 1 to X we don't have leaves" do
    a = [1, 3, 1, nil, 2, 3, 5, 4]
    expect(solution 5, a).to eq(-1)
  end

  it "should be -1 if X position is missing" do
    a = [1, 3, 1, nil, 2, 3, 6, 4]
    expect(solution 5, a).to eq(-1)
  end

  it "should include position in 0 time" do
    a = [4, 3, 1, nil, 2, 3, 5, 4]
    expect(solution 5, a).to eq 6
  end

  it "should include position in last time" do
    a = [1, 3, 1, 4, 2, 3, 5]
    expect(solution 5, a).to eq 6
  end
end


describe "solution - 1" do
  def solution(x, a)
    solution_1 x, a
  end

  it_behaves_like "solution"
end

describe "solution - 2" do
  def solution(x, a)
    solution_2 x, a
  end

  it_behaves_like "solution"

  it "should work without `stack level too deep`" do
    a = (1..10000).to_a
    expect(solution 10000, a).to eq 9999
  end
end
