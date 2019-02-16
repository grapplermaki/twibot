class TweetsController < ApplicationController
    def post
        puts "hoge"
        #t = Time.current
        #tweet = Tweet.where(day: t.tomorrow.strftime("%m%d")).first
        #tweet2 = Tweet.where(day: t.since(7.days).strftime("%m%d")).first
        #tweet3 = Tweet.where(day: t.next_month.strftime("%m%d")).first
        #status = tweet.text
        #status2 = tweet2.text
        #status3 = tweet3.text
        #response = @client.update("明日#{t.tomorrow.strftime("%m")}月#{t.tomorrow.strftime("%d")}日は　#{status}です。\r1週間後#{t.since(7.days).strftime("%m")}月#{t.since(7.days).strftime("%d")}日は　#{status2}です。\r1ヶ月後#{t.next_month.strftime("%m")}月#{t.next_month.strftime("%d")}日は　#{status3} です。 ")
        #redirect_to :root
    end  
end


