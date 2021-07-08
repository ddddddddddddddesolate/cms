Rails.application.routes.draw do
  get "/auth/auth0/callback", to: "auth0#callback"
  get "/auth/failure", to: "auth0#failure"
  get "/auth/logout", to: "auth0#logout"
end
