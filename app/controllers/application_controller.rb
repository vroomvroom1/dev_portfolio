 class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #concerns
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern

end
