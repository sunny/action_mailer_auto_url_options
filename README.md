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

Add this line to your Rails application's Gemfile:

```ruby
gem 'action_mailer_auto_url_options', github: 'sunny/action_mailer_auto_url_options'
```

Run `bundle install`, restart your server and that's it!


Usage with Sidekiq
------------------

If you delay your emails with Sidekiq, include this middleware in your
`sidekiq.rb` initializer:

```ruby
require "action_mailer_auto_url_options/middleware/sidekiq"
```

Security consideration
----------------------

This does not protect you from host-injection exploits, so please whitelist
requests to the allowed domain name in production. Read more about [this vulnerability](http://seclists.org/fulldisclosure/2008/Jun/169) because
your app may already be vulnerable if it does any kind of cache.

License
-------

MIT
