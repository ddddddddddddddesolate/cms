# frozen_string_literal: true

module Contents
  class ShowContentsService < BaseService
    def call
      OpenStruct.new(contents: Content.all)
    end
  end
end
