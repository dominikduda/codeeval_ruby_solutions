class ColumnNameConverter
  attr_accessor :column_number

  def initialize(column_number = 1)
    @column_number = column_number
  end

  def excel_header
    num = []
    temp = 0
    loop do
      break if @column_number == 0
      num.unshift(corresponding_letter(@column_number % 26))
      @column_number /= 26
      puts @column_number
    end
    num.join
  end

  private

  def corresponding_letter(number)
    (number + 64).chr
  end
end
