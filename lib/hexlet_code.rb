# frozen_string_literal: true

require_relative 'hexlet_code/version'

# Module
module HexletCode
  autoload :Tag, 'hexlet_code/tag'

  def self.form_for(object, **options, &block)
    head_tag = {
      action: options.key?(:url) ? options[:url] : '#',
      method: :post
    }.merge(options.except(:url))
    tags = block&.call(object)

    Tag.build('form', head_tag) { tags }
  end
end
