# frozen_string_literal: true

require_relative 'hexlet_code/version'

# Module
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Builder, 'hexlet_code/builder'
  autoload :Render, 'hexlet_code/render'
  autoload :Inputs, 'hexlet_code/inputs'

  def self.form_for(object, **)
    builder = Builder.new(object, **)
    yield(builder) if block_given?

    Render.render_html(builder.form_body)
  end
end
