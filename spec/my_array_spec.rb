require "./my_array"

describe "MyArray" do
  it "should raise TypeError with non Array argumen" do
    expect { MyArray.new(nil) }.to raise_error TypeError
    expect { MyArray.new("string") }.to raise_error TypeError
    expect { MyArray.new(5) }.to raise_error TypeError
  end

  it "#size" do
    my_array = MyArray.new (1..10).to_a
    expect(my_array.size).to eq 10
  end

  it "#origin" do
    my_array = MyArray.new (1..10).to_a
    expect(my_array.origin).to eq (1..10).to_a
  end

  context "#each" do
    it "should raise ArgumentError without block" do
      my_array = MyArray.new (1..10).to_a
      expect { my_array.each }.to raise_error ArgumentError
    end

    it "should work with block arguments: index, value" do
      array = (1..10).to_a
      my_array = MyArray.new array

      count = 0
      my_array.each do |index, value|
        expect(value).to be array[index]
        expect(value).not_to be nil
        count += 1
      end

      expect(count).to eq 10
    end

    it "should work with block arguments: index" do
      array = (1..10).to_a
      my_array = MyArray.new array

      count = 0
      my_array.each do |index|
        expect(array[index]).not_to be nil
        count += 1
      end

      expect(count).to eq 10
    end

    it "should work with empty array" do
      array = []
      my_array = MyArray.new array

      count = 0
      my_array.each do |index|
        expect(array[index]).not_to be nil
        count += 1
      end

      expect(count).to eq 0
    end

    it "should retrun nil as result" do
      my_array = MyArray.new (1..10).to_a
      result = my_array.each {}
      expect(result).to be nil
    end


    it "should work without `stack level too deep`" do
      array = (1..10000).to_a
      my_array = MyArray.new array

      count = 0
      my_array.each do |index, value|
        expect(value).to be array[index]
        expect(value).not_to be nil
        count += 1
      end

      expect(count).to eq 10000
    end
  end
end
