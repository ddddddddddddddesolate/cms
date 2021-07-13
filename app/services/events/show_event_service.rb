# frozen_string_literal: true

module Events
  class ShowEventService < BaseService
    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
      @id = id
    end

    def call
      event = Event.find(id)
      authorize event, :show?

      OpenStruct.new(event: event)
    end
  end
end
