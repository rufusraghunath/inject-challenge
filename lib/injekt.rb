class Array

  def injekt memo=self[0], &block
    self.each do |i|
      next if i == self[0]
      memo = yield memo, i
    end
    memo
  end

end
