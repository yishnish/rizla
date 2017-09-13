FROM ruby:2.4.1-onbuild
RUN apt-get update && apt-get install -y nodejs
RUN apt-get install libmysqlclient-dev
CMD ["rails", "s", "-e", "production", "-b", "0.0.0.0"]
