module ApplicationHelper
  def formatted_date(date)
    date.strftime "%B %-d, %Y" if date
  end
end
