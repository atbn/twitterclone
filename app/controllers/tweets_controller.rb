class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    @user = @tweet.user
    if @tweet.save
      flash[:notice] = "Your tweet has been created!"
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong!"
      render new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end

private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end
end