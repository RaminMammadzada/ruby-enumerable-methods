# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity,Metrics/ModuleLength
module Enumerable
  def my_each()
    return to_enum unless block_given?

    Array(self).length.times do |index|
      yield(Array(self)[index])
    end
    self
  end

  def my_each_with_index()
    return to_enum unless block_given?

    Array(self).length.times do |index|
      yield(Array(self)[index], index)
    end
    self
  end

  def my_select()
    result = []

    return to_enum unless block_given?

    Array(self).my_each do |item|
      next unless yield(item)

      result.push(item)
    end

    result
  end

  def my_all?(argument = nil)
    Array(self).my_each do |item|
      if !block_given?
        if argument.nil? # no argument passed
          next if item
        elsif argument.class == Class
          next if item.is_a? argument
        elsif argument.class == Regexp
          next if item =~ argument
        elsif (item.is_a? Numeric) || (item.is_a? String) # When it is a value
          next if item == argument
        end
      elsif yield(item)
        next
      end
      return false
    end
    true
  end

  def my_any?(argument = nil)
    Array(self).my_each do |item|
      if !block_given?
        if argument.nil? # no argument passed
          next unless item
        elsif argument.class == Class
          next unless item.is_a? argument
        elsif argument.class == Regexp
          next unless item =~ argument
        elsif (item.is_a? Numeric) || (item.is_a? String) # When it is a value
          next unless item == argument
        end
      else
        next unless yield(item)
      end
      return true
    end
    false
  end

  def my_none?(argument = nil)
    Array(self).my_each do |item|
      if !block_given?
        if argument.nil? # no argument passed
          next unless item
        elsif argument.class == Class
          next unless item.is_a? argument
        elsif argument.class == Regexp
          next unless item =~ argument
        elsif (item.is_a? Numeric) || (item.is_a? String)
          next unless item == argument
        end
      else
        next unless yield(item)
      end
      return false
    end
    true
  end

  def my_count(argument = nil)
    counter = 0
    Array(self).my_each do |item|
      if !block_given?
        return Array(self).length if argument.nil?
        next if item != argument

        counter += 1
      elsif yield(item) == true
        counter += 1
      end
    end

    counter
  end

  def my_map(argument = nil)
    aux_ary = []

    if argument.class == Proc
      Array(self).my_each do |item|
        aux_ary.push(argument.call(item))
      end
      return aux_ary
    end

    return to_enum unless block_given?

    Array(self).my_each do |item|
      aux_ary.push(yield(item))
    end
    aux_ary
  end

  def my_inject(arg1 = nil, arg2 = nil)
    raise LocalJumpError, 'No block Given or Empty Argument' if arg1.nil? && arg2.nil? && !block_given?

    skip_flag = false
    acum = Array(self)[0]
    if (arg1.class == Symbol) || arg1.nil?
      skip_flag = true
    elsif arg1.is_a? Numeric
      acum = arg1
    end
    Array(self).my_each_with_index do |item, index|
      next if skip_flag && index.zero?

      if block_given?
        acum = yield(acum, item)
      elsif arg1.class == Symbol
        acum = acum.send(arg1, item)
      elsif arg1.is_a? Numeric
        acum = acum.send(arg2, item)
      end
    end
    acum
  end
end

# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity,Metrics/ModuleLength

def multiply_els(my_arr)
  my_arr.my_inject(:*)
end
