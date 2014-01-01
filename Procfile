web: bundle exec rails server -p $PORT
worker: bundle exec rake jobs:work QUEUE=live_stream 
clock: bundle exec clockwork lib/clock.rb