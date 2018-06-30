class SongsController < ApplicationController

    http_basic_authenticate_with name: "Tom", password: "1234"


    def create
        @cassette = Cassette.find(params[:cassette_id])
        @song = @cassette.songs.create(song_params)
        redirect_to cassette_path(@cassette)
      end

      def destroy
        @cassette = Cassette.find(params[:cassette_id])
        @song = @cassette.songs.find(params[:id])
        @song.destroy
        redirect_to cassette_path(@cassette)
      end
     
      private
        def song_params
          params.require(:song).permit(:name, :duration)
        end

end
