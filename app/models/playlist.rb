# frozen_string_literal: true

class Playlist < ApplicationRecord
  has_one :display, dependent: :delete
  has_one :event, through: :display, dependent: :delete

  has_many :slides, dependent: :delete_all
  has_many :contents, through: :slides

  validates :name, presence: true, length: { maximum: 255 }
end
