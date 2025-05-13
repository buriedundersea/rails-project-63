# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, :gender, keyword_init: true)

describe 'TestHexletCode' do
  before do
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  it 'test_form_should_generate' do
    expected = File.read('test/test_html1.html')
    result = (HexletCode.form_for(@user, url: '#') do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text
    end)
    assert { result == expected }
  end

  it 'test_change_form_default_options_should_generate' do
    expected = File.read('test/test_html2.html')
    result = (HexletCode.form_for(@user, url: '#') do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end)
    assert { result == expected }
  end

  it 'test_raise_error_when_object_do_not_have_param' do
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :age
      end
    end
  end
end
