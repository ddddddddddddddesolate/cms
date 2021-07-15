# frozen_string_literal: true

module Displays
  # Update display service
  class UpdateDisplayService < BaseService
    attr_reader :display_params

    def initialize(current_user, display_params)
      super(current_user)
      @display_params = display_params
    end

    def call
      display = current_user.displays.find_by!(display_params.extract!(:id, :event_id))

      OpenStruct.new(success: display.update(display_params), errors: display.errors, display: display)
    end
  end
end
