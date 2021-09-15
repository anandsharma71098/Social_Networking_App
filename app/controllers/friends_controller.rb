class FriendsController < ApplicationController
    def new
        @friend=Friend.new
    end

    def create
        #byebug
        @friend=Friend.new(comment_params)
        if @friend.save
            flash[:notice]="Friend Request Sent Successfully"
            redirect_to user_path(@friend.user_id)
            #redirect_back fallback_location: @post
        else
            flash.now[:alert]="Fill correct details"
            render 'new'
        end
    end

    def comment_params
        params.require(:friend).permit(:user_id,:receiver_id,:status)
    end
end