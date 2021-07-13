# frozen_string_literal: true

module Events
  class UpdateEventService < BaseService
    attr_reader :current_user, :id, :event_params

    def initialize(current_user, id, event_params)
      @current_user = current_user
      @id = id
      @event_params = event_params
    end

    def call
      event = Event.find(id)
      authorize event, :update?

      OpenStruct.new(success: event.update(event_params), errors: event.errors, event: event)
    end
  end
end
