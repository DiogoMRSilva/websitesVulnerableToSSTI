FROM ruby:2.3
COPY src/ /home
WORKDIR /home
RUN bundle install
CMD ["ruby", "web.rb"]