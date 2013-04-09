module ApplicationHelper
  def flash_messages
    html = ""
    if flash[:error]
        html << "<div class='error'> #{flash[:error]} </div>"
    end
    if flash[:notice]
        html << "<div class='notice'> #{flash[:notice]} </div>"
    end

    html.html_safe
  end
end
