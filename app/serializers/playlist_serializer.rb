# frozen_string_literal: true

# Serializer for playlist
class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration

  has_many :slides
end
