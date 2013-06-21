module ApplicationHelper
  def fix_url(str) # "cnn.om" "http://cnn.com"
    str.starts_with?("http://") ? str : "http://#{str}"
  end

  def display_datetime(dt)
    dt.strftime("%m/%d%Y %l:%M%P") #02/12/2013 8:10pm
  end
end
