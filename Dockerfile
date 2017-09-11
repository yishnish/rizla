FROM ruby:2.4.1
RUN rake db:migrate
CMD["rails", "s", "-e", "production"]
