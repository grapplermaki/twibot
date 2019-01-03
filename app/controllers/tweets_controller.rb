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
        t = Time.current
        #tweet = Tweet.where(day: Date.today.strftime("%m%d")).first
        tweet = Tweet.where(day: t.next_month.strftime("%m%d")).first
        status = tweet.text
        response = @client.update(status)
        response = @client.update("#{status} と地の文")
        #Rails.logger.debug response
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
