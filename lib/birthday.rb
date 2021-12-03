class Birthday

  attr_reader :day, :month, :name

  MONTHS_31_DAYS = [1,3,5,7,8,10,12]
  MONTHS_30_DAYS = [4,6,9,11]

  def initialize (name, day, month)
    @name = name
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

  def year?
    if @month - Time.now.month > 0
      Time.now.year
    elsif @month - Time.now.month == 0 && @day >= Time.now.day
      Time.now.year
    else
      Time.now.year + 1
    end
  end

end