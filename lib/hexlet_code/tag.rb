# frozen_string_literal: true

module HexletCode
  # Tag
  module Tag
    def self.build(tag, attrs)
      attrs_to_string = attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(' ').prepend(' ')
      "<#{tag}#{attrs_to_string}>#{yield if block_given?}</#{tag}>"
    end
  end
end
