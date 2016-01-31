class Array

  def injekt *args

    if args.first.is_a? Integer
      memo=args.first
    else
      memo=self[0]
    end
    fail "Too many arguments!" unless args[2].nil?

    if block_given?
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
      return memo

    else # if no block

      error = "Invalid argument!"

      if args.first.is_a? Integer
        if args[1].is_a? Symbol
          sym=args[1]
        else
          fail error
        end
      else
        if args.first.is_a? Symbol
          sym=args.first
        else
          fail error
        end
      end

      if memo == self[0]
        self.each do |i|
          next if i == self[0]
          memo = memo.send(sym, i)
        end
      else
        self.each do |i|
          memo = memo.send(sym, i)
        end
      end
      return memo
    end
  end

end
