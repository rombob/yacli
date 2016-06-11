module Yacli
  class YacliError < StandardError
    class << self
      # @param [Integer] code
      def status_code(code)
        define_method(:status_code) { code }
        define_singleton_method(:status_code) { code }
      end
    end

    alias message to_s
  end

  class ExecutionError < YacliError; status_code(2); end
  class InvalidExitCodeError < YacliError
    status_code(3)
    def initialize(cmd_return)
      @cmd_return = cmd_return.inspect
    end

    def to_s
      "Command output #{@cmd_return}"
    end
  end
  class InvalidContentError < YacliError
    status_code(4)
    def initialize(cmd_return)
      @cmd_return = cmd_return.inspect
    end

    def to_s
      "Command output #{@cmd_return}"
    end
  end
end
