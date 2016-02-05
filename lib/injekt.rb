class Array

  def injekt *args

    # This is a refactor of how I previously wrote this method.
    # It is an ongoing experiment in readability.

    block_given = block_given?
    first_int = args.first.is_a? Integer
    first_sym = args.first.is_a? Symbol
    sec_sym = args[1].is_a? Symbol
    too_many_args = lambda{raise ArgumentError.new("Too many arguments")}
    arg_invalid = lambda{raise ArgumentError.new("Invalid arguments")}

    first_int ? (memo = args.first; memo_given = true) : memo = self[0]
    too_many_args.call unless args[2].nil?

    if block_given
      too_many_args.call unless args[1].nil?
    else
      if first_int
        sec_sym ? sym = args[1] : arg_invalid.call
      else
        first_sym && args[1].nil? ? sym = args.first : arg_invalid.call
      end
    end

    self.each.with_index do |i, ind|
      next if ind == 0 && !memo_given
      block_given ? memo = yield(memo, i) : memo = memo.send(sym, i)
    end

    memo

  end
end
