# Reverse works well in both cases. But recursion has restriction with
# stack level, that's why two solutions were created.
# `reverse_1` - is a simple recursion, and with big size array exeption
#               `Stack level too deep` raises.
# `reverse_2` - can work with bigger size of array without raising exeption

# Task:
#   Reverse an array without looping, or using Array#reverse

def reverse_1(origin, reversed = [], index = 0)
  return reversed if origin.size == index
  reverse_1 origin, reversed.unshift(origin[index]), index + 1
end


require "./my_array"

def reverse_2(origin)
  array = MyArray.new origin
  reversed = []

  array.each do |index, value|
    reversed.unshift value
  end

  reversed
end
