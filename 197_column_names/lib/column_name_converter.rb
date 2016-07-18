class ColumnNameConverter
  LETTER_MAP = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze

  attr_accessor :column_number, :header

  def initialize(column_number = 1)
    @column_number = column_number
    @header = ''
  end

  def excel_header
    fill_header
    header
  end

  private

  def fill_header
    reset_header
    add_next_digit until column_number == 0
  end

  def add_next_digit
    @header.prepend(corresponding_letter(next_digit))
    decrease_column_number
  end

  def decrease_column_number
    remain = remainder
    @column_number /= 26
    @column_number -= 1 if remain == 0
  end

  def next_digit
    column_number == 0 ? remainder : remainder - 1
  end

  def remainder
    column_number % 26
  end

  def corresponding_letter(number)
    LETTER_MAP[number]
  end

  def reset_header
    @header = ''
  end
end

column_name_converter = ColumnNameConverter.new
input = File.open(ARGV[0]).readlines.map(&:to_i)
input.each do |integer|
  column_name_converter.column_number = integer
  puts column_name_converter.excel_header
end
