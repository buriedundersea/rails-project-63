# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput

      def initialize(**input)
        @input = input
      end
      def render
        label + input
      end

      def label
        HexletCode::Tag.build('label', @input[:label])
      end
    end
  end
end
