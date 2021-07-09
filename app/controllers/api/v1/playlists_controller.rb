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

      def create
        result = Playlists::CreatePlaylistService.call(playlist_params)

        if result.success
          render json: {
                   data: result.playlist,
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def update
        result = Playlists::UpdatePlaylistService.call(playlist_params)

        if result.success
          render json: {
                   data: result.playlist,
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Playlists::DeletePlaylistService.call(playlist_params)

        if result.success
          render status: :no_content
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      private

      def playlist_params
        params.permit(:id, :name, :duration)
      end
    end
  end
end
