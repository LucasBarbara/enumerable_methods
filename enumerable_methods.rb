module Enumerable
  def my_each
    self.length.times do |i|
      yield(self[i])
    end
  end
end

[1, 2].my_each do |item| 
  puts (2 * item)
end
