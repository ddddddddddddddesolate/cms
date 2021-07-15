# frozen_string_literal: true

# Serializer for event
class EventSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :displays
end
