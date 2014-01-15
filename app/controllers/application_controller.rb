class ApplicationController < ActionController::Base
  protect_from_forgery

private 

  def verify_user
   	@user = current_user
  end
end
