class MyArray
  MAX_DEEP = 4000

  attr_reader :origin, :size

  def initialize(array)
    raise TypeError unless array.is_a? Array

    @origin = array
    @size = array.size
    @index = 0
  end

  def each(&block)
    raise ArgumentError unless block_given?

    @block = block

    if size < MAX_DEEP
      each_item size
    else
      each_line 0
    end
  end

  private

  def each_item(max)
    return if max == @index

    @block.call @index, origin[@index]
    @index += 1

    each_item max
  end

  def each_line(line)
    to = line * MAX_DEEP + MAX_DEEP
    to = to > size ? size : to

    each_item to
    each_line line + 1 if to != size
  end
end
