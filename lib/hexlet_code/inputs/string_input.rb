# frozen_string_literal: true

module HexletCode
  module Inputs
    # String
    class StringInput < BaseInput
      TAG_NAME = 'input'
      def input
        tag = TAG_NAME
        input_attributes = {
          name: @input[:name],
          type: 'text',
          value: @input[:value]
        }.merge(@input[:options])
        HexletCode::Tag.build(tag, input_attributes)
      end
    end
  end
end
