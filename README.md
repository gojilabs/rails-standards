# Standards
This contains the standards that Goji Labs uses for every Ruby on Rails projects

## Usage

### Healthchecks
Add `mount Standards::Engine, at: '/'` to `routes.rb`. This will add a healthcheck endpoint at `/hc`, which returns HTTP 200. Kubernetes is configured to expect this endpoint on all services we develop.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'standards', github: 'gojilabs/rails-standards'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install standards
```

## License
This gem is only to be used on projects being actively built and/or maintained by current employees Goji Labs. All other use is prohibited.