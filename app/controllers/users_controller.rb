class UsersController < ApplicationController
    def show

    end

    def index
        @users=User.all
    end

    def search
        @query=params[:query]
        @users=User.where("email LIKE ?",["%#{@query}%"])
    end
end
