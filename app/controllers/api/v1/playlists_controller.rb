# frozen_string_literal: true

module Api
  module V1
    class PlaylistsController < AuthenticatedController
      def index
        result = Playlists::ShowPlaylistsService.call(current_user)

        render json: {
                 data: ActiveModelSerializers::SerializableResource.new(result.playlists, each_serializer: PlaylistSerializer),
               }, status: :ok
      end

      def show
        result = Playlists::ShowPlaylistService.call(current_user, params[:id])

        render json: {
                 data: ActiveModelSerializers::SerializableResource.new(result.playlist, serializer: PlaylistSerializer),
               }, status: :ok
      end

      def create
        result = Playlists::CreatePlaylistService.call(current_user, playlist_params)

        if result.success
          render json: {
                   data: ActiveModelSerializers::SerializableResource.new(result.playlist, serializer: PlaylistSerializer),
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def update
        result = Playlists::UpdatePlaylistService.call(current_user, params[:id], playlist_params)

        if result.success
          render json: {
                   data: ActiveModelSerializers::SerializableResource.new(result.playlist, serializer: PlaylistSerializer),
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Playlists::DeletePlaylistService.call(current_user, params[:id])

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
        params.permit(:name, :duration)
      end
    end
  end
end
