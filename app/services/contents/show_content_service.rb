# frozen_string_literal: true

module Contents
  class ShowContentService < BaseService
    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
      @id = id
    end

    def call
      content = Content.find(id)
      authorize content, :show?

      OpenStruct.new(content: content)
    end
  end
end
