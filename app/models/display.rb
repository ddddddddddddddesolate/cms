# frozen_string_literal: true

class Display < ApplicationRecord
  belongs_to :event

  validates :event, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
