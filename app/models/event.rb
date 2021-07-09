# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
