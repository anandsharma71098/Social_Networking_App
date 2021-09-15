class UsersController < ApplicationController
    def show
        @user=User.find(params[:id])
    end

    def index
        @users=User.all
        @users= @users.order('users.created_at DESC')

    end

    def search
        @query=params[:query]
        @users=User.where("email LIKE ?",["%#{@query}%"])
        @users= @users.order('users.created_at DESC')
    end
end
