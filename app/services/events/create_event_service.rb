# frozen_string_literal: true

module Events
  class CreateEventService
    include Callable

    attr_reader :current_user, :event_params

    def initialize(current_user, event_params)
      @current_user = current_user
      @event_params = event_params
    end

    def call
      event = current_user.events.new(event_params)

      OpenStruct.new(success: event.save, errors: event.errors, event: event)
    end
  end
end
