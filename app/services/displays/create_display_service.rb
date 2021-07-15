# frozen_string_literal: true

module Displays
  # Create display service
  class CreateDisplayService < BaseService
    attr_reader :display_params

    def initialize(current_user, display_params)
      super(current_user)
      @display_params = display_params
    end

    def call
      display = current_user.displays.new(display_params)

      OpenStruct.new(success: display.save, errors: display.errors, display: display)
    end
  end
end
