# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  has_many :displays, dependent: :destroy
  has_many :playlists, through: :displays, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }, allow_blank: false
end
