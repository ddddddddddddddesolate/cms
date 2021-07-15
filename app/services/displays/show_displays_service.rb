# frozen_string_literal: true

module Displays
  # Show displays service
  class ShowDisplaysService < BaseService
    attr_reader :display_params

    def initialize(current_user, display_params)
      super(current_user)
      @display_params = display_params
    end

    def call
      displays = current_user.displays.where(display_params)

      OpenStruct.new(displays: displays)
    end
  end
end
