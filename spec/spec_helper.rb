require "simplecov"
require "coveralls"
require "yacli"
require "yacli/base"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/bin/'
end

module Helpers
  
end
