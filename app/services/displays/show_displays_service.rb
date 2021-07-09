# frozen_string_literal: true

module Displays
  class ShowDisplaysService
    include Callable

    attr_reader :current_user, :display_params

    def initialize(current_user, display_params)
      @current_user = current_user
      @display_params = display_params
    end

    def call
      displays = current_user.displays.where(display_params)

      OpenStruct.new(displays: displays)
    end
  end
end
