class SongsController < ApplicationController

    def dashboard
        @user = User.find( session[:id] )
        @all_songs = Song.all()
        # @records = PlayList.group(:song_id)
        # @records = PlayList.all()
        # 
        
        # all_songs.each do |song|
        render "songs/dashboard"
    end


    def create

        @user = User.find( session[:id] )
        @song = Song.create( params.permit(:artist, :title) )

        item = PlayList.create(user_id: @user.id, song_id: @song.id, count: 1)
        if @song.valid? && item.valid? 
            flash[:notice] = ['Created Successfully']            
            redirect_to :back
        else
            flash[:errors] = @song.errors.full_messages
            # flash[:errors] = @item.errors.full_messages
            redirect_to :back
        end
    end


    def stats
        @song = Song.find( params[:song_id] )
        render "songs/stats"
    end 


end
