$:.push File.expand_path("../lib", __FILE__)

require "action_mailer_auto_url_options/version"

Gem::Specification.new do |s|
  s.name        = "action_mailer_auto_url_options"
  s.version     = ActionMailerAutoUrlOptions::VERSION
  s.authors     = ["Sunny Ripert"]
  s.email       = ["sunny@sunfox.org"]
  s.homepage    = "http://github.com/sunny/action_mailer_auto_url_options"
  s.summary     = "ActionMailer automatic URL options"
  s.description = "Make ActionMailer use the current request host and protocol for URL generation"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1", "< 6.2"

  s.add_development_dependency "rspec-rails", ">= 3.8"
  s.add_development_dependency "combustion"
  s.add_development_dependency "sidekiq"
end
