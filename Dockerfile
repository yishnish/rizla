FROM ruby:2.4.1-onload
CMD ["rails", "s", "-e", "production", "-b", "0.0.0.0"]
