# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :userId

  has_many :displays

  def userId
    object.user_id
  end
end
