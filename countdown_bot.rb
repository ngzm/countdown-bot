require 'twitter'
require 'date'
require 'yaml'

# SayTwitter
class Tweeter
  def initialize(config)
    @config = config
  end

  def say(message)
    client = Twitter::REST::Client.new(
      consumer_key:     @config['tweet']['consumer_key'],
      consumer_secret:  @config['tweet']['consumer_secret'],
      access_token:     @config['tweet']['access_token'],
      access_token_secret: @config['tweet']['access_token_secret']
    )
    client.update message
  end
end

# Countdown Class
class CountDown
  def initialize(config)
    @config = config
  end

  def post
    the_day = Date.new(@config['theday']['year'],
                       @config['theday']['month'],
                       @config['theday']['day'])
    boring_days = (the_day - Date.today).to_i

    # Say to Twitter
    message = "Hi! just #{boring_days} days left to your Special Day."
    yield message
  end
end

# Load CONFIG FILE
CONFIG_FILE = 'countdown_bot.yml'.freeze
config = YAML.load_file(CONFIG_FILE)

countdown = CountDown.new(config)
tweet = Tweeter.new(config)

# Tweet Count Down Message
countdown.post do |message|
  tweet.say message
end
