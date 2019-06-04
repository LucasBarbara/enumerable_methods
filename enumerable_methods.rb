module Enumerable
  def my_each
    self.length.times do |i|
      yield(self[i])
    end
  end

  def my_each_with_index
    self.length.times do |i|
      yield(self[i], i)
    end
  end

end

[1, 2].my_each_with_index do |item, index| 
  puts item
  puts index
end
