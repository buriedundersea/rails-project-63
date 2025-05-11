# frozen_string_literal: true

module HexletCode
  # Class Tag
  class Tag
    def self.build(tag, attrs)
      attrs_to_string = attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
      "<#{tag} #{attrs_to_string}>"
    end
  end
end
