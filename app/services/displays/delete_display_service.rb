# frozen_string_literal: true

module Displays
  # Delete display service
  class DeleteDisplayService < BaseService
    attr_reader :event_id, :id

    def initialize(current_user, event_id, id)
      super(current_user)
      @event_id = event_id
      @id = id
    end

    def call
      event = Event.find(event_id)
      authorize event, :use?

      display = Display.find(id)

      display.destroy

      OpenStruct.new(success: display.destroyed?, errors: display.errors, display: display)
    end
  end
end
