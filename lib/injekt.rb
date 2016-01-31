class Array

  def injekt array, memo=array[0]
    array.each do |i|
      next if i == array[0]
      memo = yield memo, i
    end
    memo
  end

end
