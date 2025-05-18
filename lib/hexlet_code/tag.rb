# frozen_string_literal: true

module HexletCode
  # Tag
  class Tag
    SINGLE_TAGS = %w[input].freeze
    def self.build(tag, params)
      params_to_string = params.map { |k, v| "#{k}=\"#{v}\"" }.join(' ').prepend(' ')
      if SINGLE_TAGS.include?(tag)
        "<#{tag}#{params_to_string}>"
      else
        "<#{tag}#{params_to_string}>#{yield if block_given?}</#{tag}>"
      end
    end
  end
end
