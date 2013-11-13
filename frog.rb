# 1 - wants to get to position X
# 2 - A[K] represents the position
# 3 - one leaf falls at time K
# -------------------------------------------
# 4 - The goal is to find the earliest time when the frog can jump to the other side of the river
# 5 - The frog can cross only when leaves appear at every position across the river from 1 to X
# 6 - If the frog is never able to jump to the other side of the river, the function should return −1


# with stack level too deep
def solution_1(x, a, k=0, path=(1..x-1).to_a)
  return -1 if a.size == k
  return k if a[k] == x and path.empty?

  path.delete a[k]
  solution_1 x, a, k + 1, path
end


# without stack level too deep
require './my_array.rb'

def solution_2(x, a)
  array = MyArray.new a
  path = (1..x-1).to_a

  array.each do |index, value|
    path.delete value
    return index if value == x and path.empty?
  end

  -1
end
