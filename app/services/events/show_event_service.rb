# frozen_string_literal: true

module Events
  class ShowEventService < BaseService
    attr_reader :current_user, :event_params

    def initialize(current_user, event_params)
      @current_user = current_user
      @event_params = event_params
    end

    def call
      event = current_user.events.find_by!(@event_params)

      OpenStruct.new(event: event)
    end
  end
end
