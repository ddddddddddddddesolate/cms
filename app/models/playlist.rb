# frozen_string_literal: true

class Playlist < ApplicationRecord
  has_one :display, dependent: :destroy
  has_one :event, through: :display, dependent: :destroy

  has_many :slides, dependent: :destroy
  has_many :contents, through: :slides

  belongs_to :user

  validates :name, presence: true, length: { maximum: 255 }, allow_blank: false
end
