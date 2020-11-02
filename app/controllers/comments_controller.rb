class CommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.comments.build(comment_params)
    comment.tweet_id = tweet.id
    comment.save
    redirect_to tweet_path(tweet.id)
  end

  def show
    @tweet = Tweet.find_by(id:params[:tweet_id])
    @comment = Comment.find_by(id:params[:id])
    @user = @comment.user
  end

  def edit
    @comment = Comment.find_by(id:params[:id])
    @tweet = Tweet.find_by(id:params[:tweet_id])
  end

  def update
    @post = Comment.find_by(id:params[:id])
    @post.update(comment_params)
    redirect_to tweet_path(params[:tweet_id])
  end

  def destroy
    @comment = Comment.find_by(id:params[:id])
    @comment.destroy
    @tweet = Tweet.find_by(id:params[:tweet_id])
    redirect_to tweet_path(@tweet.id)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
