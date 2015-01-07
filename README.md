[![Build Status](http://img.shields.io/travis/theodi/jiffybag.svg)](https://travis-ci.org/theodi/jiffybag)
[![Dependency Status](http://img.shields.io/gemnasium/theodi/jiffybag.svg)](https://gemnasium.com/theodi/jiffybag)
[![Coverage Status](http://img.shields.io/coveralls/theodi/jiffybag.svg)](https://coveralls.io/r/theodi/jiffybag)
[![Code Climate](http://img.shields.io/codeclimate/github/theodi/jiffybag.svg)](https://codeclimate.com/github/theodi/jiffybag)
[![Gem Version](http://img.shields.io/gem/v/jiffybag.svg)](https://rubygems.org/gems/jiffybag)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://theodi.mit-license.org)
[![Badges](http://img.shields.io/:badges-7/7-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

# JiffyBag

A safer environment variable loader, that wraps around dotenv.

JiffyBag lets you specify easily which environment variables should be present,
and will raise an exception if they're not set at configure-time.

It will also raise exceptions if you try to access a variable that wasn't
included in the list at configure time.

The rationale is that with everything in `ENV` in the good 12-factor way, there
aren't really any checks on what's there, or that what you're asking for is valid.
It also allows you to get a list of variables that are loaded from `ENV`, which is
very useful for things like hiding sensitive data in VCR cassettes reliably.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jiffybag'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jiffybag

## Usage

At initialisation time, run:

```ruby
JiffyBag.configure %w{
  VARIABLE_ONE
  VARIABLE_TWO
}
```

Then, later on, to use the vars:

```ruby
JiffyBag["VARIABLE_ONE"]
```

To list vars:
```ruby
JiffyBag.variables
#=> ["VARIABLE_ONE", "VARIABLE_TWO"]
```

Dotenv will automatically load at configure time, using the default `.env` file.
If you want to load from other env files, provide an array of filenames as the
second argument to `#configure`:

```ruby
JiffyBag.configure %w{
  VARIABLE_ONE
  VARIABLE_TWO
}, ["./production_env", "./shared_env"]
```

Last thing - you can call `#configure` multiple times, so it can be used in gems
and applications that use them without conflict.

```ruby
JiffyBag.configure ["VARIABLE_ONE"]
JiffyBag.configure ["VARIABLE_TWO"]
JiffyBag.variables
#=> ["VARIABLE_ONE", "VARIABLE_TWO"]
```

## Contributing

1. Fork it ( https://github.com/theodi/jiffybag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
