# frozen_string_literal: true

module Api
  module V1
    class PlaylistsController < AuthenticatedController
      def index
        result = Playlists::ShowPlaylistsService.call(current_user)

        render json: {
                 data: result.playlists,
               }, status: :ok
      end
    end
  end
end
