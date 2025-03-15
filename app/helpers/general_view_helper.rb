module GeneralViewHelper
  def format_date(date)
    date.strftime("%m/%d/%Y")
  end

  def days_remaining(start_date, end_date)
    (end_date - start_date).to_i
  end
end
