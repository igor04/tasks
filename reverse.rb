# with stack level too deep
def reverse_1(origin, reversed = [], index = 0)
  return reversed if origin.size == index
  reverse_1 origin, reversed.unshift(origin[index]), index + 1
end


# without stack level too deep
require "./my_array"

def reverse_2(origin)
  array = MyArray.new origin
  reversed = []

  array.each do |index, value|
    reversed.unshift value
  end

  reversed
end
