require 'twitter'
require 'yaml'

# SayTwitter
class Tweeter
  def say(message)
    client = Twitter::REST::Client.new(
      consumer_key:     CONFIG['tweet']['consumer_key'],
      consumer_secret:  CONFIG['tweet']['consumer_secret'],
      access_token:     CONFIG['tweet']['access_token'],
      access_token_secret: CONFIG['tweet']['access_token_secret']
    )
    client.update message
  end
end

# Countdown Class
class CountDown
  def post
    boring_days = (Date.new(CONFIG['theday']['year'],
                            CONFIG['theday']['month'],
                            CONFIG['theday']['day']) - Date.today).to_i
    htag = CONFIG['hushtags'].sample

    # Say to Twitter
    message = "Just #{boring_days} days left to my Special Day. ##{htag}"
    yield message
  end
end

# Load CONFIG FILE
CONFIG = YAML.load_file('countdown_bot.yml')

countdown = CountDown.new
tweet = Tweeter.new

# Tweet Count Down Message
countdown.post do |message|
  tweet.say message
  # puts message
end
