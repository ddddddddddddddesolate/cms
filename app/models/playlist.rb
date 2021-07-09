# frozen_string_literal: true

class Playlist < ApplicationRecord
  has_one :display, dependent: :delete
  has_one :event, through: :display, dependent: :delete
end
