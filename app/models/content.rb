# frozen_string_literal: true

class Content < ApplicationRecord
  mount_uploader :content, ContentUploader
  validates :content, presence: true
end
