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
      authorize Event.find(event_id), :use?

      display = Display.includes(playlist: %i[slides contents])
                       .find_by(id: id, event_id: event_id)

      OpenStruct.new(display: display)
    end
  end
end
