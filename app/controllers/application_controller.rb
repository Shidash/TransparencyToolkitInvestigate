class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

 def user_for_paper_trail
    signed_in? ? current_user : 'anonymous'
  end
 

  def handle_unverified_request
    sign_out
    super
  end
end
