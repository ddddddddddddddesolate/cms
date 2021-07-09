class AddDurationToPlaylist < ActiveRecord::Migration[6.1]
  def change
    add_column :playlists, :duration, :bigint, default: 3600
  end
end
