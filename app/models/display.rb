# frozen_string_literal: true

class Display < ApplicationRecord
  belongs_to :event
  belongs_to :playlist, optional: true

  has_one :user, through: :event

  validates :name, presence: true, length: { maximum: 255 }, allow_blank: false
end
