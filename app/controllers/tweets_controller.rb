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
        puts '#{t}'
        #tweet = Tweet.where(day: Date.today.strftime("%m%d")).first
        tweet = Tweet.where(day: t.tomorrow.strftime("%m%d")).first
        tweet2 = Tweet.where(day: t.since(7.days).strftime("%m%d")).first
        tweet3 = Tweet.where(day: t.next_month.strftime("%m%d")).first
        status = tweet.text
        status2 = tweet2.text
        status3 = tweet3.text
        #response = @client.update(status)
        response = @client.update("明日#{t.tomorrow.strftime("%m")}月#{t.tomorrow.strftime("%d")}日は　#{status}です。\r1週間後#{t.since(7.days).strftime("%m")}月#{t.since(7.days).strftime("%d")}日は　#{status2}です。\r1ヶ月後#{t.next_month.strftime("%m")}月#{t.next_month.strftime("%d")}日は　#{status3} です。 ")
        #response = @client.update("#{status} と地の文")
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
