# frozen_string_literal: true

class Display < ApplicationRecord
  belongs_to :event
  belongs_to :playlist

  validates :event, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
