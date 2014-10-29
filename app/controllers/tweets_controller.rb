class TweetsController < ApplicationController
  

  def index
    @tweets = Tweet.all
  end


  
  def show
    @tweet = Tweet.find(params[:id])
  end


  def new
    @tweet = Tweet.new
  end

  
  def edit
    @tweet = Tweet.find(params[:id])
  end


  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = @current_user 
      if @tweet.save
        redirect_to @tweet, notice: 'Tweet was successfully created.' 
      else
        render :new 
      end
  end

  def update
    @tweet = Tweet.find(params[:id])
      if @tweet.update(tweet_params)
        redirect_to @tweet, notice: 'Tweet was successfully updated.'
      else
         render :edit 
      end
  end


  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully deleted.' 
  end

  def timeline
    # Read up on ActiveRecord for more about this query:
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", @current_user.following_ids, @current_user)
    render :index
  end

  
 
  def tweet_params
    params.require(:tweet).permit( :name, :user_id, :content)
  end

end
