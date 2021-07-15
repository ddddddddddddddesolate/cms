# frozen_string_literal: true

module Contents
  # Delete content service
  class DeleteContentService < BaseService
    attr_reader :id

    def initialize(current_user, id)
      super(current_user)
      @id = id
    end

    def call
      content = Content.find(id)
      authorize content, :destroy?

      content.destroy

      OpenStruct.new(success: content.destroyed?, errors: content.errors, content: content)
    end
  end
end
