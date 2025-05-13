# frozen_string_literal: true

module HexletCode
  # Builder
  class Builder
    attr_reader :form_body, :options

    def initialize(object, **)
      @form_body = []
      @object = object
      @options = {**}
    end

    def input(obj_param, as: nil, **options)
      if as.nil?
        tag = :input
        params = { name: obj_param, type: 'text', value: @object.public_send(obj_param) }.merge(options)
      elsif as == :text
        tag = :textarea
        params = { name: obj_param, cols: '20', rows: '40' }.merge(options)
      end
      label = Tag.build(:label, for: obj_param) { obj_param.capitalize }
      result = Tag.build(tag, params) { @object.public_send(obj_param) }
      @form_body << label << result
    end

    def submit(value = 'Save')
      @form_body << Tag.build(:input, type: 'submit', value: value)
    end
  end
end
