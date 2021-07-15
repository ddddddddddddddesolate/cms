# frozen_string_literal: true

# Serializer for content
class ContentSerializer < ActiveModel::Serializer
  attributes :id, :url

  def url
    object.content.url
  end
end
