# frozen_string_literal: true

module Contents
  class DeleteContentService < BaseService
    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
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
