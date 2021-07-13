# frozen_string_literal: true

module Events
  class ShowEventsService < BaseService
    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

    def call
      OpenStruct.new(events: policy_scope(Event))
    end
  end
end
