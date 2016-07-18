input = File.open(ARGV[0]).readlines
input.each { |line| puts line.split(' ').reverse.join(' ') }

# test
=begin
input = "Hello World\nHello CodeEval"
output = "World Hello\nCodeEval Hello"
puts wrapper(input) == output ? 'SUCCESS' : 'FAIL'
=end
