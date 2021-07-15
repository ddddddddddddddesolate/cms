# frozen_string_literal: true

module Events
  # Show event service
  class ShowEventService < BaseService
    attr_reader :id

    def initialize(current_user, id)
      super(current_user)
      @id = id
    end

    def call
      authorize Event.find(id), :show?
      event = Event.includes(displays: [playlist: %i[slides contents]]).find(id)

      OpenStruct.new(event: event)
    end
  end
end
