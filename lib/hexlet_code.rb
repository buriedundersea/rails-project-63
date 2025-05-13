# frozen_string_literal: true

require_relative 'hexlet_code/version'

# Module
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Builder, 'hexlet_code/builder'
  autoload :Render, 'hexlet_code/render'

  def self.form_for(object, **)
    builder = Builder.new(object, **)
    yield(builder) if block_given?

    Render.render_html(builder.form_body, builder.options)
  end
end

User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

puts (HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end)