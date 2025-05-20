# frozen_string_literal: true

module HexletCode
  module Inputs
    # Text
    class TextInput < BaseInput
      TAG_NAME = 'textarea'
      COLS = 20
      ROWS = 40
      def input
        tag = TAG_NAME
        input_attributes = {
          name: @input[:name],
          cols: COLS,
          rows: ROWS
        }.merge(@input[:options])
        HexletCode::Tag.build(tag, input_attributes) { @input[:value] }
      end
    end
  end
end
