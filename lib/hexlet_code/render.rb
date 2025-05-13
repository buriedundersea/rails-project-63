# frozen_string_literal: true

module HexletCode
  # Tag
  class Render
    def self.render_html(form_body, options)
      params = {
        action: options.key?(:url) ? options[:url] : '#',
        method: :post
      }.merge(options.except(:url))
      Tag.build(:form, params) do
        form_body.empty? ? nil : form_body.join("\n\t").insert(0, "\n\t").insert(-1, "\n")
      end
    end
  end
end
