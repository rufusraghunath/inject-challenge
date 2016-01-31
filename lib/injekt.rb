class Array

  def injekt memo=self[0]
    if memo == self[0]
      self.each do |i|
        next if i == self[0]
        memo = yield memo, i
      end
    else
      self.each do |i|
        memo = yield memo, i
      end
    end
    memo
  end

end
