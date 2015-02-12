module ApplicationHelper
  def formatted_date(datetime)
    datetime.strftime "%B %-d, %Y" if datetime
  end

  def formatted_time(datetime)
    datetime.strftime "%l:%M %p"
  end
end
