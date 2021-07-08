class Auth0Controller < ApplicationController
  def callback
    auth_info = request.env["omniauth.auth"]
    cookies[:userinfo] = auth_info["extra"]["raw_info"]
  end

  def failure
    @error_msg = request.params[:message]
  end

  def logout
    reset_session
    redirect_to logout_url
  end

  private

  AUTH0_CONFIG = Rails.application.credentials.auth0

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: AUTH0_CONFIG[:client_id],
    }

    URI::HTTPS.build(host: AUTH0_CONFIG[:domain], path: "/v2/logout", query: to_query(request_params)).to_s
  end

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join("&")
  end
end
