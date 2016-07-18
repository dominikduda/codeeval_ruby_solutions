input = File.open(ARGV[0]).readlines
input.each do |line|
  splitted_line = line.split(',').map(&:to_i)
  bin_number = splitted_line.first.to_s(2).reverse
  puts bin_number[splitted_line[1] - 1] == bin_number[splitted_line[2] - 1]
end

# test
=begin
input = "86,2,3\n125,1,2"
output = "true\nfalse"
puts wrapper(input) == output ? 'SUCCESS' : 'FAIL'
=end
