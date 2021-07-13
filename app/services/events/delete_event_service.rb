# frozen_string_literal: true

module Events
  class DeleteEventService < BaseService
    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
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
