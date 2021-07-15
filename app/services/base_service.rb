# frozen_string_literal: true

# Base service with includes
class BaseService
  include Callable
  include Pundit

  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end
end
