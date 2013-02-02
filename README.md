[![Build Status](https://secure.travis-ci.org/samuelkadolph/yaml-options.png?branch=master)](http://travis-ci.org/samuelkadolph/yaml-options)

# yaml-options

yaml-options

## Description

yaml-options

## Installation

Add this line your application's Gemfile:

    gem "yaml-options"

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install yaml-options

## Usage

```ruby
require "yaml/options"

options = YAML::Options.load <<-YAML
---
aws:
  s3:
    key: abc123
YAML

options.aws.s3.key # => "abc123"
```

## Contributing

Fork, branch & pull request.
