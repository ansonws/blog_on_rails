class CommentsController < ApplicationController
    def create 
        @post = Post.find(params[:post_id])
        @comment = Comment.new comment_params
        @comment.post = @post
        
        if @comment.save
            flash[:primary] = "Comment created"
            redirect_to post_path(@post)
        else
            flash[:danger] = @comment.errors.full_messages.join(', ')
            redirect_to post_path(@post)
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:danger] = "Comment was deleted"
        redirect_to post_path(@comment.post)
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end


    
end
