module ActionMailerAutoUrlOptions

  class Engine < Rails::Engine
    initializer "action_mailer_auto_url_options.controller" do |app|
      ActionController::Base.send :include, ActionMailerAutoUrlOptions::Controller
    end
  end

end
