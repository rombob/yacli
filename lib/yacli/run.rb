require "yacli"
require "json"
require "erb"

module Yacli
  class Run < Base
  
    def initialize(opt)
      @log = init_logger(opt['log-path'])
      @log.debug "opt: #{opt.inspect}"
    end
  
    def go(cmd = 'uname -a')
      @log.debug "cmd: #{cmd}"
      output = pass_cli cmd
      @log.info "output: #{output}"
      output
    end
  end
end