# frozen_string_literal: true

AUTH0_CONFIG = Rails.application.credentials.auth0

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    AUTH0_CONFIG["client_id"],
    AUTH0_CONFIG["client_secret"],
    AUTH0_CONFIG["domain"],
    callback_path: "/auth/auth0/callback",
    authorize_params: {
      scope: "openid profile",
    },
  )
end
