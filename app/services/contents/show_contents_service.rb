# frozen_string_literal: true

module Contents
  # Show contents service
  class ShowContentsService < BaseService
    def call
      OpenStruct.new(contents: policy_scope(Content))
    end
  end
end
