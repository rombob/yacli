Yacli
=====

[![Gem Version](http://img.shields.io/gem/v/yacli.svg)][gem]
[![Build Status](http://img.shields.io/travis/rombob/yacli.svg)][travis]
[![Code Climate](http://img.shields.io/codeclimate/github/rombob/yacli.svg)][codeclimate]
[![Coverage Status](https://img.shields.io/coveralls/rombob/yacli.svg)][coveralls]
[![Codacy Badge](https://api.codacy.com/project/badge/grade/dc6b761f73aa423ba610746d19f8597c)][codacy]

[gem]: https://rubygems.org/gems/yacli
[travis]: http://travis-ci.org/rombob/yacli
[coveralls]: https://coveralls.io/r/rombob/yacli
[codacy]: https://www.codacy.com/app/github_50/yacli

Description
-----------
Yacli a.k.a yet another CLI, is a simple gem allowing to build custom CLI wrappers.
It uses [Thor][thor] as a CLI option manager as well as additional minimal helpers for logging and output handling.

Please note: Yacli, by design, is a system tool created to allow seamless file and url
access, which should not receive application user input. It relies on [open-uri][open-uri],
which combined with application user input would provide a command injection attack
vector.

[thor]: https://github.com/ruby/rake
[open-uri]: https://ruby-doc.org/stdlib-2.5.1/libdoc/open-uri/rdoc/index.html

Prerequisites
-------------
You will need the following:

- Ruby 2.5+
- Bundler

Docker integration:

- TBD

## Installation

Add this line to your application's Gemfile:

    gem 'yacli'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install yacli

## Installation with Docker

TBD:

    tbd

## Usage

    $ yacli help [COMMAND]                                          # Describe expanded available commands or one specific command

## TODO
Wish-list of features [TODO][] file for suggestions.

[todo]: TODO.md

## Contributing

1. [Fork it]( https://github.com/rombob/yacli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Released under the MIT License.  See the [LICENSE][] file for further details.

[license]: LICENSE.md
