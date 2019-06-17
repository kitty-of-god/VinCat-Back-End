class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Knock::Authenticable
  #undef_method :current_user
end
