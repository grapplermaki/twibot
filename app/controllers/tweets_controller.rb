class TweetsController < ApplicationController
    before_action :twitter_client, except: :new

    def new
      @tweet = Tweet.new
    end

    def create
        Tweet.create(create_params)
        redirect_to :root
    end

    def post
        #d = Date.today
        #tweet = Tweet.order("RANDOM()").first
        #tweet = Tweet.where("SELECT text from tweets where id = '1'" )
        #tweet = Tweet.where("id = '3'" ).first
        #tweet = Tweet.where("day = strftime('%m月%d日', 'now')").first
        tweet = Tweet.where("id = '' ").first
        #tweet = Tweet.where("day = strftime('%m%d', '2018-12-22')").first
        #tweet = Tweet.order("SELECT text from tweets where day = strftime('%m月%d日', 'now');").first
        status = tweet.text
        #media = open(tweet.image)
        #@client.update_with_media(status, media)
        #response = @client.update(status)
        response = @client.update(status)
        Rails.logger.debug response
        redirect_to :root
    end
    
    def twitter_client
        @client = Twitter::REST::Client.new do |config|
          config.consumer_key = ENV['CONSUMER_KEY'] 
          config.consumer_secret = ENV['CONSUMER_SECRET']
          config.access_token = ENV['ACCESS_TOKEN']
          config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
        end
    end

      private
      def create_params
        params.require(:tweet).permit(:text, :image)
      end   
end
