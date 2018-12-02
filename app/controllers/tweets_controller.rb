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
        tweet = Tweet.order("RANDOM()").first
        status = tweet.text
        #media = open(tweet.image)
        #@client.update_with_media(status, media)
        @client.update(status)
        redirect_to :root
    end
    
    def twitter_client
        @client = Twitter::REST::Client.new do |config|
          config.consumer_key = "m9P1E2U02U7mLGnO3f1KY9MbQ"
          config.consumer_secret = "iL0rB8kdgt2mVF8JELtyeZAhbBqazMmvhH6217VAZSwBkfyNI4"
          config.access_token = "1031386587328798722-6P8FACV9QwvpV16b4Wl4KXFFCU8GHI"
          config.access_token_secret = "uPPxW3QYONMxdxegR5uVcwZuIxXzCo8T8OcqzjDybYcle"
        end
    end

      private
      def create_params
        params.require(:tweet).permit(:text, :image)
      end   
end
