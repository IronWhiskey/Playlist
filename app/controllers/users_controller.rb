class UsersController < ApplicationController
    
    def index
        render "users/main"
    end
    


    def create
        @user = User.create( params.permit(:first_name, :last_name, :email, :password) )
        p "user.valid is: #{@user.valid?}"
        if @user.valid?
            flash[:notice] = ['Registered Successfully']            
            session[:id] = @user.id
            redirect_to "/main"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end
    end
    


    def playlist
        @user = User.find( params[:id] )
        @records = PlayList.where(user_id: @user.id)
        render  "users/playlist"
    end
      
    

    def add
        @user = User.find( session[:id] )
        @song = Song.find( params[:song_id] )
        @record = PlayList.where(user_id: @user.id, song_id: @song.id)
        if @record.length > 0
            rec = @record[0]
            rec.count += 1
            rec.save
        else
            record_new = PlayList.create( user_id: @user.id, song_id: @song.id, count: 1 )
        end
        redirect_to :back
    end
end
