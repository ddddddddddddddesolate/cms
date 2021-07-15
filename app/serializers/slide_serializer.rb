# frozen_string_literal: true

# Serializer for slide
class SlideSerializer < ActiveModel::Serializer
  attributes :id, :weight

  belongs_to :content
end
