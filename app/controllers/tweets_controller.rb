class TweetsController < ApplicationController

  #this section is to show all of the tweet we are following
  def index
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", @current_user.following_ids, @current_user)
  end

  def show
     @tweet = Tweet.find params[:id]
     if @tweet.user = @current_user 
        redirect_to @tweet.user.id
      else 
        render
      end 
  end

  def new
    @tweet = Tweet.new
  end

  
  def edit

     @tweet = Tweet.find params[:id]

  end

  def create
    @tweet = Tweet.new tweet_params
    @tweet.user = @current_user 
      if @tweet.save
        redirect_to @tweet
      else
        render :new 
      end
  end

  def update

    @tweet = Tweet.findparams[:id]
      if @tweet.update tweet_params
        redirect_to @tweet

      else
         render :edit 
      end
  end

  def destroy

    @tweet = Tweet.find params[:id]

    @tweet.destroy
    redirect_to tweets_url
  end



  def tweet_params
    params.require(:tweet).permit( :name, :user_id, :content)
  end

end
