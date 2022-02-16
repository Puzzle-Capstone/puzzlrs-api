# SIDEKIQ_REDIS_CONFIGURATION = {
#   url: ENV["REDIS_PROVIDER"], # if one assumes that REDIS_PROVIDER indirection is reliably present
#   ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } # we must trust Heroku and AWS here
# }

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://:p277ea292dfb09565422a8a3c282ec0a412e87fc86367f70939ac3f1971228290@ec2-52-206-55-195.compute-1.amazonaws.com:27539' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://:p277ea292dfb09565422a8a3c282ec0a412e87fc86367f70939ac3f1971228290@ec2-52-206-55-195.compute-1.amazonaws.com:27539' }
end