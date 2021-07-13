# frozen_string_literal: true

class SlideSerializer < ActiveModel::Serializer
  attributes :id, :weight

  belongs_to :content
end
