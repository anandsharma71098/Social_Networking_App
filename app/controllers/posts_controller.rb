class PostsController < ApplicationController

    before_action :set_post, only: [:show,:edit,:update,:destroy]
    before_action :authenticate_user!, except: [:index,:show]
    def show
        #byebug
        #@post=Post.find(params[:id])
        @comments= @post.comments
    end

    def index
        @posts=Post.all
    end

    def new
        @post=Post.new
    end

    def create
        #byebug
        @post=Post.new(post_params)
        if @post.save
            flash[:notice]="Post Successfully Created"
            redirect_to post_path(@post)
        else
            flash.now[:alert]="Fill correct details"
            render 'new'
        end
    end

    def edit
        #@post=Post.find(params[:id])
    end

    def update
        #@post=Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice]="Post was updated successfully"
            redirect_to post_path(@post)
        else
            flash.now[:alert]="Fill correct details"
            render 'edit'
        end
    end

    def destroy
        #@post=Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private

    def set_post
        @post=Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title,:description,:image,:private,:user_id)
    end

end