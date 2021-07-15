# frozen_string_literal: true

# Base application controller
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from Pundit::NotAuthorizedError, with: :render_not_authorized_response

  # @param [String] message
  def render_not_found_response(message)
    render json: {
      error: message
    }, status: :not_found
  end

  # @param [String] message
  def render_not_authorized_response(message)
    render json: {
      error: message
    }, status: :forbidden
  end
end
