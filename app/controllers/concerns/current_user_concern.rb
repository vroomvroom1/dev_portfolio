module CurrentUserConcern
  extend ActiveSupport::Concern


#either call parent method for registered accounts or use default guest greeting
  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User", first_name: "Guest",
                    last_name: "User", email: "guest@example.com")
  end

end
