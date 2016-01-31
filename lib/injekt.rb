class Array

  def injekt memo=self[0], block
    if memo == self[0]
      self.each do |i|
        next if i == self[0]
        memo = memo.send(block, i)
      end
    else
      self.each do |i|
        memo = memo.send(block, i)
      end
    end
    memo
  end

end
