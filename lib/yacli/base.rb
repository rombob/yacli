require 'logger'
require 'socket'

module Yacli
  class Base
    def init_logger(log_path = nil)
      output_file = log_path.nil? ? STDOUT : log_path
      logger = Logger.new(output_file)
      logger.level = (!ENV['DEBUG'].nil?) ? Logger::DEBUG : Logger::INFO
      logger.debug "logger.level: #{logger.level}"
      logger
    end
    
    def error_exit(msg, exit_code = 1)
      @log.error msg
      exit exit_code
    end
    
    def pass_cli(cmd, valid_out_pattern = nil)
      cmd += ' 2>&1'
      @log.debug "running cmd: #{cmd}"
      cmd_out = `#{cmd}`
      success_exec = $?.success?
      @log.info "cmd_out: #{cmd_out}"
      @log.debug "success_exec: #{success_exec}"
      
      valid_content = valid_out_pattern.nil? ? true : !cmd_out.match(/#{valid_out_pattern}/).nil?
      @log.debug "valid_content: #{valid_content}"
      
      error_exit "Not successful execution or not valid_content! out: #{cmd_out}" if (!success_exec || !valid_content)
      cmd_out
    end
  end
end
