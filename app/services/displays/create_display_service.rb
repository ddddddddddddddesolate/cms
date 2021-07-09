# frozen_string_literal: true

module Displays
  class CreateDisplayService
    include Callable

    attr_reader :current_user, :display_params

    def initialize(current_user, display_params)
      @current_user = current_user
      @display_params = display_params
    end

    def call
      display = current_user.displays.new(display_params)

      OpenStruct.new(success: display.save, errors: display.errors, display: display)
    end
  end
end
