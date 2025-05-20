# frozen_string_literal: true

module HexletCode
  # Builder
  class Builder
    attr_reader :form_body, :options

    def initialize(object, **options)
      @object = object
      action = options.fetch(:url, '#')
      method = options.fetch(:method, 'post')
      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: { action:, method: }.merge(options.except(:url, :method))
      }
    end

    def input(name, **options)
      @form_body[:inputs] << build_input_attributes(name, options)
    end

    def submit(value = 'Save', attributes = {})
      all_attributes = { tag: 'input', type: 'submit', value: }.merge(attributes)
      @form_body[:submit] = { options: all_attributes }
    end

    def build_input_attributes(name, options)
      {
        name: name,
        type: options.fetch(:as, :string),
        value: @object.public_send(name),
        label: { for: name, content: name.capitalize },
        options: options.except(:as)
      }
    end
  end
end
