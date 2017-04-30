FROM ruby:latest
MAINTAINER ngzm<nk.ngzm@gmail.com>
ADD . /usr/src/app
RUN cd /usr/src/app && bundle install
RUN cd /usr/src/app && chmod u+x countdown_bot.sh
CMD ["/usr/src/app/countdown_bot.sh"]
