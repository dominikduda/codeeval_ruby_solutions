class ColumnNameConverter
  attr_accessor :column_number

  def initialize(column_number = 1)
    @column_number = column_number
  end

  def excel_header
    num = []
    num.unshift(add_next_digit) until column_number <= 1
    num.join
  end

  private

  def add_next_digit
    digit = next_digit
    @column_number /= 26
    digit
  end

  def next_digit
    last_digit? ? corresponding_letter(column_number) : corresponding_letter(column_number % 26)
  end

  def last_digit?
    column_number <= 26
  end

  def corresponding_letter(number)
    (number + 64).chr
  end
end

column_name_converter = ColumnNameConverter.new
input = File.open(ARGV[0]).readlines.map(&:to_i)
input.each do |integer|
  column_name_converter.column_number = integer
  puts column_name_converter.excel_header
end
