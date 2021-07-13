# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from Pundit::NotAuthorizedError, with: :render_not_authorized_error_response

  def render_not_found_response(message)
    render json: {
             error: message,
           }, status: :not_found
  end

  def render_not_authorized_error_response(message)
    render json: {
             error: message,
           }, status: :forbidden
  end
end
