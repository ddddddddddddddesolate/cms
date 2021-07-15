# frozen_string_literal: true

module Displays
  # Show display service
  class ShowDisplayService < BaseService
    attr_reader :display_params, :event_id, :id

    def initialize(current_user, event_id, id)
      super(current_user)
      @event_id = event_id
      @id = id
    end

    def call
      event = Event.find(event_id)
      authorize event, :use?

      display = event.displays.find(id)

      OpenStruct.new(display: display)
    end
  end
end
