module ApplicationHelper
  def friendly_date(d)
    d.strftime("%B %e, %y")
  end
end
