require 'thor'

module Yacli
  class Cli < Thor
    def self.common_opts
      method_option :'dry-run', aliases: '-d', type: :boolean, default: false
    end

    desc 'cli', 'run cli'
    common_opts
    method_option :cmd, aliases: '-c', default: 'uname'
    def cli
      require 'yacli/base'
      b = Base.new
      b.cli(options)
      # b.log("I'm logging")
      # b.log("I'm logging error", :error)
    end
  end
end
