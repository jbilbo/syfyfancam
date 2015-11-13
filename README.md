# Syfyfancam

[![Build Status](https://travis-ci.org/jbilbo/syfyfancam.svg?branch=master)](https://travis-ci.org/jbilbo/syfyfancam) [![Code Climate](https://codeclimate.com/github/jbilbo/syfyfancam/badges/gpa.svg)](https://codeclimate.com/github/jbilbo/syfyfancam) [![Test Coverage](https://codeclimate.com/github/jbilbo/syfyfancam/badges/coverage.svg)](https://codeclimate.com/github/jbilbo/syfyfancam/coverage)

Ruby library to obtain the list of images associated to an online Syfyfancam video. See: http://www.syfyfancam.com/view-all-fancam-videos/

## Installation

### Command line

```
$ gem install syfyfancam
```

### Gemfile

Add:
```ruby
gem 'syfyfancam', '~> 0.1'
```

and then execute:
```
$ bundle
```

## Usage

```ruby
require 'syfyfancam'

syfyfancam = Syfyfancam::URL.new('http://www.syfyfancam.com/videos/ojt1nd5bnbog/')
syfyfancam.images
# => ["http://d1fmy74dfqc2hp.cloudfront.net/resources/footage/vE/oJt1Nd5BnboG/001.jpg", "http://d1fmy74dfqc2hp.cloudfront.net/resources/footage/vE/oJt1Nd5BnboG/002.jpg", ... , ]
syfyfancam.personal_hash
# => "ojt1nd5bnbog"
```

## License

Copyright © 2015 Jonathan Hernández

Distributed under the MIT License.
