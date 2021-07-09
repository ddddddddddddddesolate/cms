# frozen_string_literal: true

module Events
  class DeleteEventService
    include Callable

    attr_reader :current_user, :event_params

    def initialize(current_user, event_params)
      @current_user = current_user
      @event_params = event_params
    end

    def call
      event = current_user.events.find_by!(event_params)
      event.destroy

      OpenStruct.new(success: event.destroyed?, errors: event.errors)
    end
  end
end
