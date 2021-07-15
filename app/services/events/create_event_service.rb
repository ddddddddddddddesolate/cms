# frozen_string_literal: true

module Events
  # Create event service
  class CreateEventService < BaseService
    attr_reader :event_params

    def initialize(current_user, event_params)
      super(current_user)
      @event_params = event_params
    end

    def call
      event = current_user.events.new(event_params)

      OpenStruct.new(success: event.save, errors: event.errors, event: event)
    end
  end
end
