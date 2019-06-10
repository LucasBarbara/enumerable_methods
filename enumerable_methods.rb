module Enumerable
  def my_each
    self.length.times do |i|
      yield(self[i])
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    new_array = []

    self.my_each do |element|
      new_array << element if yield(element)
    end
    new_array
  end

  def my_all?
    self.my_each do |element|
      return false if !yield(element)
    end
    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count(obj = nil)
    i = 0

    self.my_each do |element|
      if block_given?
        i += 1 if yield element
      elsif obj != nil
        i += 1 if element == obj
      else
        i = self.length
      end
    end

    i
  end

  def my_map
    new_array = []

    self.my_each do |element|
      new_element = yield(element)
      new_array << new_element
    end

    new_array
  end

  def my_inject(memo = nil)
    accum = memo ? memo : self[0]

    if accum != memo
      i = 1
      while i < self.length
        accum = yield(accum, self[i])
        i += 1
      end
    else
      self.my_each do |element|
        accum = yield(accum, element)
      end
    end

    accum
  end

end

def multiply_els(array)
  array.my_inject do |x, n| 
    x * n 
  end
end
