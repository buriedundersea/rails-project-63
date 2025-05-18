# frozen_string_literal: true

module HexletCode
  # Tag
  class Render
    def self.render_html(form_body)
      Tag.build(:form, form_body[:form_options]) do
        form_body.empty? ? nil : form_body.join("\n\t").insert(0, "\n\t").insert(-1, "\n")
      end
    end
  end
end
