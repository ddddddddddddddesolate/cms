# frozen_string_literal: true

module Displays
  # Delete display service
  class DeleteDisplayService < BaseService
    attr_reader :display_params

    def initialize(current_user, display_params)
      super(current_user)
      @display_params = display_params
    end

    def call
      display = current_user.displays.find_by!(display_params)

      display.destroy

      OpenStruct.new(success: display.destroyed?, errors: display.errors, display: display)
    end
  end
end
