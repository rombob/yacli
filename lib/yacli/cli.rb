module Yacli
  class Cli
    def self.start
      require 'yacli/base'
      b = Base.new
      options = Base.options do
        opt :cmd, "Number of limbs", :default => 'uname', :type => :string
      end
      b.log("running CLI with options: #{options.inspect}")
      result = b.cli(options)
      b.log("result: #{result.inspect}")
      #b.log("I'm logging error", :error)
    end
  end
end
