# frozen_string_literal: true

class Slide < ApplicationRecord
  belongs_to :playlist
  belongs_to :content

  validates :weight, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true, length: { maximum: 255 }, allow_blank: false

  default_scope { order(weight: :asc) }
end
