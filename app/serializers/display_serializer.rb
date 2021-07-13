# frozen_string_literal: true

class DisplaySerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :playlist
end
