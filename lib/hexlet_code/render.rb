# frozen_string_literal: true

module HexletCode
  # Tag
  class Render
    def self.render_html(form_body)
      inputs = form_body[:inputs].map { |input| build_input_tag(input) }
      submit = build_submit_tag(form_body[:submit][:options]) unless form_body[:submit][:options].nil?

      HexletCode::Tag.build('form', form_body[:form_options]) { "#{inputs.join}#{submit}\n" }
    end

    def self.build_input_tag(input)
      klass_name = "HexletCode::Inputs::#{input[:type].capitalize}Input"
      klass = Object.const_get(klass_name)
      input_obj = klass.new(input)
      input_obj.render
    end

    def self.build_submit_tag(options)
      submit_tag = HexletCode::Tag.build(options[:tag], options.except(:tag))
      "\n\t#{submit_tag}"
    end
  end
end
