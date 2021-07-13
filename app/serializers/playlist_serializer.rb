# frozen_string_literal: true

class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration

  has_many :slides
end
