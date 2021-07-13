# frozen_string_literal: true

module Contents
  class ShowContentsService < BaseService
    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

    def call
      OpenStruct.new(contents: current_user.contents)
    end
  end
end
