# frozen_string_literal: true

class Slide < ApplicationRecord
  belongs_to :playlist
  belongs_to :content

  validates :playlist, presence: true
  validates :content, presence: true
  validates :weight, presence: true, numericality: { only_integer: true }

  default_scope { order(weight: :asc) }
end
