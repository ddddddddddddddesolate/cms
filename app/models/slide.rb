# frozen_string_literal: true

class Slide < ApplicationRecord
  belongs_to :playlist
  belongs_to :content

  validates :weight, presence: true, numericality: { only_integer: true }
  validates :name, presence: true, length: { maximum: 255 }

  default_scope { order(weight: :asc) }
end
