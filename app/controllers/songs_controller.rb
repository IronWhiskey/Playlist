class SongsController < ApplicationController

    def dashboard
        @user = User.find( session[:id] )
        @all_songs = Song.all()
        render "songs/dashboard"
    end



    def create
        @user = User.find( session[:id] )

        @song = Song.where( artist: params[:artist],  title: params[:title] )
        
        if @song.length > 0
            # flash[:notice] = ['Created Successfully']            
            flash[:notice] = ['Song already exists']            
            redirect_to :back
        else
            # flash[:errors] = @song.errors.full_messages
            @song = Song.create( params.permit(:artist, :title) )
            item = PlayList.create(user_id: @user.id, song_id: @song.id, count: 1)
            redirect_to :back
        end
    end



    def stats
        @song = Song.find( params[:song_id] )
        render "songs/stats"
    end 
end
