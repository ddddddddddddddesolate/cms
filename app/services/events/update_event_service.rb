# frozen_string_literal: true

module Events
  # Update event service
  class UpdateEventService < BaseService
    attr_reader :id, :event_params

    def initialize(current_user, id, event_params)
      super(current_user)
      @id = id
      @event_params = event_params
    end

    def call
      event = Event.includes(displays: [playlist: %i[slides contents]])
                   .find(id)
      authorize event, :update?

      OpenStruct.new(success: event.update(event_params), errors: event.errors, event: event)
    end
  end
end
