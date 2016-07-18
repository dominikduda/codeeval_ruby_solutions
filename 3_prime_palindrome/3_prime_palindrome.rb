require 'prime'

result = 0
Prime.each(1000) { |prime| result = prime if prime.to_s == prime.to_s.reverse }
puts result
