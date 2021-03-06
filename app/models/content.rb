# frozen_string_literal: true

class Content < ApplicationRecord
  has_many :slides, dependent: :destroy
  has_many :playlists, through: :slides

  belongs_to :user

  validates :content, presence: true

  mount_uploader :content, ContentUploader
end
