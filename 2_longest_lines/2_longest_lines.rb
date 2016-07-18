input = File.open(ARGV[0]).readlines
required_amount_of_lines = input.shift.to_i
puts input.sort { |a, b| b.length <=> a.length }.take(required_amount_of_lines).join
