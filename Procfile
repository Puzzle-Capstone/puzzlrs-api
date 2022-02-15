web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -e production -C config/initializers/sidekiq.rb
release: bundle exec rake db:migrate