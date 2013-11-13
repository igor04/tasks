# MyArray was implemented because of recursion has restriction with stack level,
# and with big size array exeption `Stack level too deep` raises.
#
# MyArray contains #each method which is built on recursion, with separation
# on smaller parts(lines). Each part(line) contains limited number(MAX_DEEP) of items.
# So we can work not only with array which size is MAX_DEEP, but also with
# array which size is MAX_DEEP * MAX_DEEP
#
# MAX_DEEP - number when the stack level is not too deep

class MyArray
  MAX_DEEP = 4000

  attr_reader :origin, :size

  def initialize(array)
    raise TypeError unless array.is_a? Array

    @origin = array
    @size = array.size
  end

  def each(&block)
    raise ArgumentError unless block

    @index = 0
    @block = block

    each_line
  end

  private

  def each_item(max)
    return if max == @index

    @block.call @index, origin[@index]
    @index += 1

    each_item max
  end

  def each_line(line = 0)
    to = line * MAX_DEEP + MAX_DEEP
    to = to > size ? size : to

    each_item to
    each_line line + 1 if to != size
  end
end
