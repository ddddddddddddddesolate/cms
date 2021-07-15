# frozen_string_literal: true

module Playlists
  # Delete playlist service
  class DeletePlaylistService < BaseService
    attr_reader :id

    def initialize(current_user, id)
      super(current_user)
      @id = id
    end

    def call
      playlist = Playlist.find(id)
      authorize playlist, :destroy?

      playlist.destroy

      OpenStruct.new(success: playlist.destroyed?, errors: playlist.errors, playlist: playlist)
    end
  end
end
