class Birthday

  attr_reader :day, :month

  MONTHS_31_DAYS = [1,3,5,7,8,10,12]
  MONTHS_30_DAYS = [4,6,9,11]

  def initialize (day, month)
    @day = day
    @month = month
  end

  def valid?
    if @day.class != Integer || @month.class != Integer
      return false
    elsif @month == 2 && @day > 29
      return false
    elsif MONTHS_30_DAYS.include?(@month) && @day > 30
      return false
    elsif MONTHS_31_DAYS.include?(@month) && @day > 31
      return false
    else
      return true
    end
  end

  def birthday?
    @day == Time.now.day && @month == Time.now.month
  end

end