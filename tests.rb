require './enumerable'

my_array = %w[jerry tom dine]

test_array1 = [11, 2, 3, 56]
test_array2 = %w[a b c d]
test_hash = { name: 'John', last: 'Doe' }

puts 'Test #my_each method'
p(test_array1.my_each { |x| print x })
print "\n"
p(test_array2.my_each { |x| print x })
# print "\n"
# print test_array2.my_each
# print "\n"
# p (1..10).my_each { |x| print x } #range
p(test_hash.my_each { |x| print x }) # hash
puts '- - - -'

puts 'Test #my_each_with_index method'
my_array.my_each_with_index do |elem, index|
  puts "Element: #{elem}  | Index:  #{index}"
end
# p my_array.my_each_with_index
# (1..5).my_each_with_index do |elem, index|
#   puts "Element: #{elem}  | Index:  #{index}"
# end
# test_hash.my_each_with_index do |elem, index|
#   puts "Element: #{elem}  | Index:  #{index}"
# end
# puts '- - - -'

# puts 'Test #my_select method'
# var1 = (1..10).my_select { |i| (i % 3).zero? }
# print var1 #=> [3, 6, 9]
# print "\n"
# puts((1..10).my_select)
# puts "- - - -\n"

puts 'Test #my_all method'
# puts(%w[ant bear cat].my_all? { |word| word.length >= 3 }) #=> true
# puts(%w[ant bear cat].my_all? { |word| word.length >= 4 }) #=> false
puts %w[ant bear cat].my_all?(/t/) #=> false
# puts %w[ant bear cat].all?(/t/)
# puts [1, 2i, 3.14].my_all?(Numeric) #=> true
# puts [nil, true, 99].my_all? #=> false
# puts [].my_all? #=> true
# puts [1, 2].my_all?(1) #=> false
# puts [1, 1].my_all?(1) #=> true
# puts %w[a b].my_all?('b') #=> false
# puts %w[a a].my_all?('a') #=> true
puts "- - - -\n"

puts 'Test #my_any method'
# puts(%w[ant bear cat].my_any? { |word| word.length >= 3 }) #=> true
# puts(%w[ant bear cat].my_any? { |word| word.length >= 4 }) #=> true
puts %w[ant bear cat].my_any?(/x/) #=> false
# puts %w[ant bear cat].any?(/x/)
# puts [nil, true, 99].my_any?(Integer) #=> true
# puts [nil, true, 99].my_any? #=> true
# puts [].my_any? #=> false
# puts [1, 2, 3, 's'].my_any?(String) #=> true
# puts [1, 2, 3, 's'].my_any?(Numeric) #=> true
# puts [1, 2, 3].my_any?(String) #=> false
# puts [1, 2].my_any?(1) # true
# puts [1, 1].my_any?(1) # true
# puts "- - - -\n"

puts 'Test #my_none method'
puts %w[ant bear cat].my_none?(/a/) #=> true
# puts %w[ant bear cat].none?(/a/)
# puts(%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
# puts(%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
# puts [1, 3.14, 42].my_none?(Float) #=> false
# puts [].my_none? #=> true
# puts [nil].my_none? #=> true
# puts [nil, false].my_none? #=> true
# puts [nil, false, true].my_none? #=> false
# puts [1, 2, 3].my_none?(1) #=> false
# puts [1, 2, 3].my_none?(4) #=> true
# puts [nil, false, nil, false].my_none? # true
# puts "- - - -\n"

# puts 'Test #my_count method'
# ary = [1, 2, 9, 7, 11, 23, 8]
# puts ary.my_count #=> 7
# puts ary.my_count(9) #=> 1
# puts ary.my_count(2) #=> 1
# puts ary.my_count(&:even?) #=> 2
# puts ary.my_count(&:odd?) #=> 5
# puts (1..10).my_count #=> 10
# puts "- - - -\n"

# puts 'Test #my_map method'
# print((1..4).my_map { |i| i * i }) #=> [1, 4, 9, 16]
# print "\n"
# print((1..4).my_map { 'cat' }) #=> ["cat", "cat", "cat", "cat"]
# print "\n"
# puts 'Map method'
# print([1, 2, 7, 4, 5].map { |x| x * x })
# print "\n"
# puts 'My_Map method'
# print([1, 2, 7, 4, 5].my_map { |x| x * x })
# print "\n"
# puts 'Map method'
# print((1..2).map { |x| x * x })
# print "\n"
# puts 'My_Map method'
# print((1..2).my_map { |x| x * x })
# print "\n"

# my_proc = proc { |x| x * x }
# puts 'My_Map method with block'
# print([1, 2, 7, 4, 5].my_map { |x| x * x })
# print "\n"
# puts 'My_Map method which takes proc as an argument'
# print [1, 2, 7, 4, 5].my_map(my_proc)
# print "\n"

# print "\n"
# puts 'My_Map method without block'
# print [1, 2, 7, 4, 5].my_map
# print "\n"
# puts "- - - -\n"

puts 'Test #my_inject method'
puts((5..10).my_inject(:*)) #=> 151200
puts((5..10).my_inject { |sum, n| sum + n }) #=> 45
puts((5..10).my_inject(2) { |sum, n| sum + n }) #=> 47
puts((5..10).my_inject(2) { |prod, n| prod * n }) #=> 302400
puts((5..10).my_inject(2, :*)) #=> 302400
puts((5..10).my_inject(1) { |product, n| product * n }) #=> 151200
puts("Without argument: #{(5..10).my_inject}")
puts
puts "- - - -\n"

# puts 'Test #multiply_els method'
# puts multiply_els([2, 4, 5]) #=> 40
# puts "- - - -\n"
