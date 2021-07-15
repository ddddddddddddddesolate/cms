# frozen_string_literal: true

module Displays
  # Show display service
  class ShowDisplayService < BaseService
    attr_reader :display_params

    def initialize(current_user, display_params)
      super(current_user)
      @display_params = display_params
    end

    def call
      display = current_user.displays.find_by!(display_params)

      OpenStruct.new(display: display)
    end
  end
end
