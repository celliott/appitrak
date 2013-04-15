module ApplicationHelper
  
  def display_error(field)
    if @user.errors[field].any?
        raw "#{field.to_s.tr("_", " ")} "+@user.errors[field].first+"<br>"
    end
  end


end