# frozen_string_literal: true

class Content < ApplicationRecord
  validates :content, presence: true
end
