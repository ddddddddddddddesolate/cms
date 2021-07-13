# frozen_string_literal: true

module Playlists
  class DeletePlaylistService < BaseService
    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
      @id = id
    end

    def call
      playlist = Playlist.find(ud)
      authorize playlist, :destroy?

      playlist.destroy

      OpenStruct.new(success: playlist.destroyed?, errors: playlist.errors, playlist: playlist)
    end
  end
end
