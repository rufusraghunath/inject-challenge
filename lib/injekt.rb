class Array

  def injekt array, memo=0
    array.each do |i|
      memo = yield memo, i
    end
    memo
  end

end
