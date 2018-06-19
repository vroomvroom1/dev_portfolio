module ApplicationHelper

#Works like partial but more ruby code, implemented in view
  def login_helper
   if current_user.is_a?(GuestUser)
    (link_to "Register", new_user_registration_path) +
     "<br>".html_safe +
    (link_to "Login", new_user_session_path)
  else
     link_to "Logout", destroy_user_session_path, method: :delete
   end
end

  def source_helper(layout_name)
    # session data being displayed on page
         if session[:source]
           greeting = "Thanks for visiting me from #{session[:source]}"
           content_tag(:p, greeting, class: "source-greeting")
         end
  end
end
