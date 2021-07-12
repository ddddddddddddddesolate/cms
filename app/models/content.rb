# frozen_string_literal: true

class Content < ApplicationRecord
  has_many :slides, dependent: :delete_all
  has_many :playlists, through: :slides

  validates :content, presence: true

  mount_uploader :content, ContentUploader
end
