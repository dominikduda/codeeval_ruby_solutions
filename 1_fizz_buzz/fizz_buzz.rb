File.open(ARGV[0]).each_line do |line|
  game_data = line.split(' ').map(&:to_i)
  1.upto(game_data[2]) do |number|
    if number % game_data[0] == 0 && number % game_data[1] == 0
      print 'FB'
    elsif number % game_data[0] == 0
      print 'F'
    elsif number % game_data[1] == 0
      print 'B'
    else
      print number
    end
    print ' '
  end
  puts
end
