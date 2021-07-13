# frozen_string_literal: true

module Displays
  class UpdateDisplayService < BaseService
    attr_reader :current_user, :display_params

    def initialize(current_user, display_params)
      @current_user = current_user
      @display_params = display_params
    end

    def call
      display = current_user.displays.find_by!(display_params.extract!(:id, :event_id))

      OpenStruct.new(success: display.update(display_params), errors: display.errors, display: display)
    end
  end
end
