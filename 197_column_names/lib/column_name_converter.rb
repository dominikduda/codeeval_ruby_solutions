class ColumnNameConverter
  attr_accessor :column_number

  def initialize(column_number = 1)
    @column_number = column_number
  end

  def excel_header
    num = []
    num.unshift(add_next_digit) until column_number == 0
    num.join
  end

  private

  def add_next_digit
    digit = next_digit
    @column_number /= 26
    digit
  end

  def next_digit
    corresponding_letter(column_number % 26)
  end

  def corresponding_letter(number)
    (number + 64).chr
  end
end
