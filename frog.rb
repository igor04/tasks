# Solution works well in both cases. But recursion has restriction with
# stack level, that's why two solutions were created.
# `solution_1` - is a simple recursion, and with big size array, exception
#                like `Stack level too deep` raises.
# `solution_2` - can work with bigger size of array without raising exception

# Some points from the task:
#   - frog wants to get to position X
#   - A[K] represents the position
#   - one leaf falls at time K
#   -----------------------------------------
#   - The goal is to find the earliest time when the frog can jump to the other side of the river
#   - The frog can cross only when leaves appear at every position across the river from 1 to X
#   - If the frog is never able to jump to the other side of the river, the function should return −1

def solution_1(x, a, k=0, path=(1..x-1).to_a)
  return -1 if a.size == k
  return k if a[k] == x and path.empty?

  path.delete a[k]
  solution_1 x, a, k + 1, path
end


require './my_array'

def solution_2(x, a)
  array = MyArray.new a
  path = (1..x-1).to_a

  array.each do |index, value|
    path.delete value
    return index if value == x and path.empty?
  end

  -1
end
