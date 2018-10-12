require 'logger'
require 'socket'
require 'open3'
require 'optimist'

module ToBoolean
  def to_bool
    return true if self == true || to_s.strip =~ /^(true|yes|y|1)$/i
    false
  end
end

class NilClass; include ToBoolean; end
class TrueClass; include ToBoolean; end
class FalseClass; include ToBoolean; end
class Numeric; include ToBoolean; end
class String; include ToBoolean; end

module Yacli
  class Base
    def init_logger(log_path = nil)
      output_file = log_path.nil? ? STDOUT : log_path
      logger = Logger.new(output_file)
      logger.level = !ENV['DEBUG'].nil? ? Logger::DEBUG : Logger::INFO
      logger.debug "logger.level: #{logger.level}"
      logger
    end

    def self.options(&block)
      Trollop.options(&block)
    end

    def initialize(opt = {})
      @opt = opt
      @log = init_logger
      @log.debug "@opt: #{@opt.inspect}"
    end

    def log(msg, level = :info)
      @log.send(level, msg)
    end

    def error_exit(msg)
      @log.error msg
      raise ExecutionError
    end

    def init_opt(key, opt, default = '')
      val = opt[key] || default
      @log.debug "#{key}: #{val}"
      val
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

      raise InvalidExitCodeError, cmd_out unless success_exec
      raise InvalidContentError, cmd_out unless valid_content
      result = { success: success_exec, output: cmd_out, exit_code: exit_code.to_i }
      @log.debug "run result: #{result.inspect}"
      result
    end

    def cli(opts = {})
      cmd = init_opt(:cmd, opts, '')
      valid_out_pattern = init_opt(:valid_out_pattern, opts, nil)
      reverse_match = init_opt(:reverse_match, opts, false)
      hide_output = init_opt(:hide_output, opts, false).to_bool
      include_stderr = init_opt(:include_stderr, opts, true).to_bool
      cmd += ' 2>&1' if include_stderr
      @log.debug "running cmd: #{cmd}"

      cmd_out = []
      exit_code = nil
      Open3.popen2(cmd) do |stdin, stdout, thread|
        stdin.close
        while line = stdout.gets
          @log.info ">>> #{line.chomp}" unless hide_output
          cmd_out << line.chomp
        end

        exit_code = thread.value
      end
      success_exec = exit_code.success?
      cmd_out = cmd_out.join($INPUT_RECORD_SEPARATOR)
      @log.debug "success_exec: #{success_exec.inspect}"
      @log.debug "cmd_out: #{cmd_out.inspect}" unless hide_output

      @log.debug "reverse_match: #{reverse_match.inspect}"
      output_match = reverse_match ? cmd_out.match(/#{valid_out_pattern}/).nil? : !cmd_out.match(/#{valid_out_pattern}/).nil?
      @log.debug "output_match: #{output_match.inspect}"
      valid_content = valid_out_pattern.nil? ? true : output_match
      @log.debug "valid_content: #{valid_content}"

      raise InvalidExitCodeError, cmd_out unless success_exec
      raise InvalidContentError, cmd_out unless valid_content
      result = { success: success_exec, output: cmd_out, exit_code: exit_code.to_i }
      @log.debug "run result: #{result.inspect}"
      result
    end
  end
end
