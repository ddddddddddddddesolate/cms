# frozen_string_literal: true

class AddPlaylistToDisplay < ActiveRecord::Migration[6.1]
  def change
    add_reference :displays, :playlist, null: false, foreign_key: true
  end
end
