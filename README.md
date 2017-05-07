# countdown_bot
Countdown to the Special day

## Setup
This program works on Docker continer.

#### 1) clone this

```shell
# git clone https://github.com/ngzm/countdown-bot.git

# cd countdown-bot
```

#### 2) Set your Twitter App information to countdown_bot.yml

```ruby
tweet:
  consumer_key:         'Your-consumer_key'
  consumer_secret:      'Your-consumer_secret'
  access_token:         'Your-access_token'
  access_token_secret:  'Your-access_token_secret'
```

#### 3) build the docker image

```shell
# docker build -t [image_name] .
```

#### 4) make and run the docker container

```shell
# docker run --name [container_name] [image_name]
```

## Japanese Information
For more infomation, please check out [my blog (Japanese)](http://ngzm.hateblo.jp/entry/2017/04/26/184448).
