ActionMailer automatic URL options
==================================

Make ActionMailer use the current request host, port and protocol for URL
generation.


Why?
----

In Rails apps, if you create links in your emails, you need to set the
host, port and protocol in every environment configuration file you use.

This plugin removes that need by using the current request's host, port and
protocol instead.

This is also helpful when you use different domain names, based on the language
for example.


Install
-------

Add these lines to your Rails application's Gemfile:

```ruby
# Add the current request host and protocol in email URLs
gem "action_mailer_auto_url_options"
```

Run `bundle install`, restart your server and that's it!


Usage with Sidekiq
------------------

If you delay your emails with Sidekiq, include this middleware in
`config/initializers/sidekiq.rb`:

```ruby
require "action_mailer_auto_url_options/middleware/sidekiq"
```

License
-------

MIT

Development
-----------

Clone this project, then install dependencies with:

```sh
$ bundle
```

And launch tests with:

```sh
$ bundle exec rspec
```
