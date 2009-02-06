module ApplicationHelper
  def chronic_date_string(*args)
    Chronic.parse(*args).to_date.to_s
  end
end
