# frozen_string_literal: true

module Events
  # Show events service
  class ShowEventsService < BaseService
    def call
      OpenStruct.new(events: policy_scope(Event))
    end
  end
end
