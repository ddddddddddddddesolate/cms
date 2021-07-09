# frozen_string_literal: true

module Events
  class UpdateEventService
    include Callable

    attr_reader :current_user, :event_params

    def initialize(current_user, event_params)
      @current_user = current_user
      @event_params = event_params
    end

    def call
      event = current_user.events.find_by!(id: event_params[:id])

      OpenStruct.new(success: event.update(event_params), errors: event.errors, event: event)
    end
  end
end
