class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index 
        @posts = Post.all.order(created_at: :asc)
    end

    def new
        @post = Post.new
    end

    def create 
        @post = Post.new post_params
        if @post.save
            flash[:primary] = "Created post \"#{@post.title}\""
            redirect_to post_path(@post)
        else
            flash[:danger] = @post.errors.full_messages.join(', ')
            redirect_to new_post_path
        end
    end

    def show
        @comment = Comment.new
        @comments = @post.comments.order(created_at: :desc)
    end

    def edit
    end

    def update
        if @post.update post_params
            flash[:primary] = "#{@post.title} was updated"
            redirect_to post_path(@post)
        else
            flash[:danger] = @post.errors.full_messages.join(', ')
            redirect_to edit_post_path(@post)
        end
    end

    def destroy
        flash[:danger] = "#{@post.title} was deleted"
        @post.destroy
        redirect_to posts_path
    end

    private 

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end
    
end
