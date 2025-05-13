# frozen_string_literal: true

module HexletCode
  # Builder
  class Builder
    attr_reader :form_body, :options

    def initialize(object, **options)
      @form_body = []
      @object = object
      @options = options
    end

    def input(obj_param, as: nil, **options)
      if as.nil?
        tag = :input
        params = { name: obj_param, type: 'text', value: @object.public_send(obj_param) }.merge(options)
      elsif as == :text
        tag = :textarea
        params = { name: obj_param, cols: '20', rows: '40' }.merge(options)
      end

      result = Tag.build(tag, params) { @object.public_send(obj_param) }
      @form_body << result
    end
  end
end
