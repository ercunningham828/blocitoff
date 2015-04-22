class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private
  def authenticated?
    authenticate_or_request_with_http_basic('Administration') do |email, password|
      @logged_user = User.find_by_email(email)
      @logged_user.valid_password?(password)
    end
  end

end
