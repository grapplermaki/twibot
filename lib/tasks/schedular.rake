namespace :twitter do
    desc "This task is called by the Heroku scheduler add-on"
    task :tweet_action => :environment do
      puts "hoge"
      twitter_client
      t = Time.current
      puts "#{t}"
      #tweet = Tweet.where(day: Date.today.strftime("%m%d")).first
      tweet = Tweet.where(day: t.tomorrow.strftime("%m%d")).first
      tweet2 = Tweet.where(day: t.since(7.days).strftime("%m%d")).first
      tweet3 = Tweet.where(day: t.next_month.strftime("%m%d")).first
      puts "#{tweet}"
      puts "#{tweet2}"
      puts "#{tweet3}"
      status = tweet.text
      status2 = tweet2.text
      status3 = tweet3.text
      #response = @client.update(status)
      response = @client.update("明日#{t.tomorrow.strftime("%m")}月#{t.tomorrow.strftime("%d")}日は　#{status}です。\r1週間後#{t.since(7.days).strftime("%m")}月#{t.since(7.days).strftime("%d")}日は　#{status2}です。\r1ヶ月後#{t.next_month.strftime("%m")}月#{t.next_month.strftime("%d")}日は　#{status3} です。 ")
      #response = @client.update("#{status} と地の文")
      #Rails.logger.debug response
      #redirect_to :root
      #@client.update("herokuのテスト")
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