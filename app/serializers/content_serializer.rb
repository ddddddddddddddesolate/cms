# frozen_string_literal: true

class ContentSerializer < ActiveModel::Serializer
  attributes :id, :url

  def url
    object.content.url
  end
end
