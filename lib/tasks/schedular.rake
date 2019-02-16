namespace :twitter do
    desc "This task is called by the Heroku scheduler add-on"
    task :tweet_action => :environment do
      puts "hoge"
      twitter_client
      @client.update("herokuのテスト")
    end
  end
  
  def twitter_client
    @client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['CONSUMER_KEY']
        config.consumer_secret = ENV['CONSUMER_SECRET']
        config.access_token = ENV['ACCESS_TOKEN']
        config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end