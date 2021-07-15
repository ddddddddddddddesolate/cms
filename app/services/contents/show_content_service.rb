# frozen_string_literal: true

module Contents
  # Show content service
  class ShowContentService < BaseService
    attr_reader :id

    def initialize(current_user, id)
      super(current_user)
      @id = id
    end

    def call
      content = Content.find(id)
      authorize content, :show?

      OpenStruct.new(content: content)
    end
  end
end
