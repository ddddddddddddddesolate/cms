# frozen_string_literal: true

module Events
  # Delete event service
  class DeleteEventService < BaseService
    attr_reader :id

    def initialize(current_user, id)
      super(current_user)
      @id = id
    end

    def call
      event = Event.find(id)
      authorize event, :destroy?

      event.destroy

      OpenStruct.new(success: event.destroyed?, errors: event.errors)
    end
  end
end
