require 'term/ansicolor'

module SSHKit

  module Formatter

    class Dot < Abstract

      def write(obj)
        if obj.is_a? SSHKit::Command
          if obj.finished?
            original_output << (obj.failure? ? c.red('.') : c.green('.'))
          end
        end
      end
      alias :<< :write

      private

      def c
        @c ||= Term::ANSIColor
      end

    end

  end

end
