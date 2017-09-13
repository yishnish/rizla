FROM ruby:2.4.1-onbuild
CMD ["rails", "s", "-e", "production", "-b", "0.0.0.0"]
