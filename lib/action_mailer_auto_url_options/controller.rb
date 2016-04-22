module ActionMailerAutoUrlOptions

  # Included in the app's Application Controller
  module Controller
    extend ActiveSupport::Concern

    included do
      before_action :make_action_mailer_use_request_host_and_protocol
    end

    private

    # Via http://makandracards.com/makandra/1353
    def make_action_mailer_use_request_host_and_protocol
      ActionMailer::Base.default_url_options[:protocol] = request.protocol
      ActionMailer::Base.default_url_options[:host] = request.host_with_port
    end
  end

end
