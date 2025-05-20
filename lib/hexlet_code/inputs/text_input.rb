# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      TAG_NAME = 'textarea'
      COLS = 20
      ROWS = 40

      def initialize
        super
      end

      def input
        common_attributes = { tag: TAG_NAME, cols: COLS, rows: ROWS }
        @input[:content] = @input[:value]
        attributes = @input.except(:type, :value)
        input_attributes = attributes.merge(common_attributes)
        HexletCode::Tag.build(input_attributes[:tag], input_attributes.except(:tag))
      end

    end
  end
end
