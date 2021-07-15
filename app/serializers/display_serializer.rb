# frozen_string_literal: true

# Serializer for display
class DisplaySerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :playlist
end
