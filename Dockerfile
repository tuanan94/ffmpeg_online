FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
RUN cp -a ffmpeg/. /usr/local/bin/
EXPOSE  3000
CMD ["rails", "server", "-b", "0.0.0.0"]