# frozen_string_literal: true

module HexletCode
  module Inputs
    # BaseInput
    class BaseInput
      def initialize(input)
        @input = input
      end

      def render
        "\n\t#{label}\n\t#{input}"
      end

      def label
        HexletCode::Tag.build('label', @input[:label].except(:content)) { @input[:label][:content] }
      end
    end
  end
end
