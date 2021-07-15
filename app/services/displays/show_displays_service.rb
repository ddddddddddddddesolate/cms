# frozen_string_literal: true

module Displays
  # Show displays service
  class ShowDisplaysService < BaseService
    attr_reader :event_id

    def initialize(current_user, event_id)
      super(current_user)
      @event_id = event_id
    end

    def call
      event = Event.find(event_id)
      authorize event, :use?

      displays = event.displays

      OpenStruct.new(displays: displays)
    end
  end
end
