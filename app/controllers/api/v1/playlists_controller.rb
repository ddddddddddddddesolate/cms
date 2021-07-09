# frozen_string_literal: true

module Api
  module V1
    class PlaylistsController < AuthenticatedController
      def index
        result = Playlists::ShowPlaylistsService.call

        render json: {
                 data: result.playlists,
               }, status: :ok
      end

      def show
        result = Playlists::ShowPlaylistService.call(playlist_params)

        render json: {
                 data: result.playlist,
               }, status: :ok
      end

      private

      def playlist_params
        params.permit(:id)
      end
    end
  end
end
