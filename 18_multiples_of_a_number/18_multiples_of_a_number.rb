def smallest_multiple(input)
  input.each do |line|
    splitted_line = line.split(',').map(&:to_i)
    x, n = splitted_line.first.to_i, splitted_line.last.to_i
    1.step do |i|
      next if i * n < x
      n *= i
      break
    end
    puts n
  end
end

smallest_multiple(File.open(ARGV[0]).readlines)

# test
=begin
input = "13,8\n17,16"
output = "16\n32"
puts wrapper(input) == output ? 'SUCCESS' : 'FAIL'
=end
