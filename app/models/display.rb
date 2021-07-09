# frozen_string_literal: true

class Display < ApplicationRecord
  belongs_to :event
  belongs_to :playlist, optional: true

  validates :name, presence: true, length: { maximum: 255 }
  validates :event, presence: true
end
