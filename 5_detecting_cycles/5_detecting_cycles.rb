def cycle(line)
  splitted_line = line.split(' ')
  1.upto([splitted_line.length, 50].max) do |tested_cycle_length|
    cons_arr = []
    splitted_line.each_cons(tested_cycle_length) { |cons| cons_arr << cons }
    0.upto(cons_arr.length - 1) do |j|
      return cons_arr[j] if cons_arr[j] == cons_arr[j + tested_cycle_length]
    end
  end
end

input = File.open(ARGV[0]).readlines
input.each do |line|
  puts cycle(line).join(' ')
end

# test
=begin
input = "2 0 6 3 1 6 3 1 6 3 1\n3 4 8 0 11 9 7 2 5 6 10 1 49 49 49 49\n1 2 3 1 2 3 1 2 3"
output = "6 3 1\n49\n1 2 3"
puts wrapper(input) == output ? 'SUCCESS' : 'FAIL'
=end
