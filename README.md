# SlugConverter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slug_converter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slug_converter

## Usage
To define your own alphabet for slug, create an initializer config/initializers/slug_converter.rb and add configuration

  SlugConverter.configuration.alphabet = "your characters go here"

In order to get a encoded slug based on the provided integer value initialize SlugConverter like this

  slug = SlugConverter.new(number).slug

the same way you can get the decoded integer value based on the given slug like this

number = SlugConverter.new(slug).number

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/slug_converter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
