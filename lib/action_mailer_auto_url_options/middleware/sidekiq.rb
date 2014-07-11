module Sidekiq::Middleware::ActionMailerDefaultUrlOption
  # Get the current Action Mailer default URL options and store them in the
  # message to be sent to Sidekiq.
  class Client
    def call(worker_class, msg, queue, redis_pool)
      options = ActionMailer::Base.default_url_options
      msg['action_mailer_default_url_options'] ||= options
      yield
    end
  end

  # Pull the message's Action Mailer default URL options out and set the
  # current thread to use them.
  class Server
    def call(worker, msg, queue)
      options = msg['action_mailer_default_url_options'].symbolize_keys
      ActionMailer::Base.default_url_options = options if options
      yield
    end
  end
end

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add Sidekiq::Middleware::ActionMailerDefaultUrlOption::Client
  end
end

Sidekiq.configure_server do |config|
  config.client_middleware do |chain|
    chain.add Sidekiq::Middleware::ActionMailerDefaultUrlOption::Client
  end
  config.server_middleware do |chain|
    chain.add Sidekiq::Middleware::ActionMailerDefaultUrlOption::Server
  end
end
