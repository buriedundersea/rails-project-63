# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, keyword_init: true)

describe 'TestHexletCode' do
  it 'test_that_it_has_a_version_number' do
    refute_nil ::HexletCode::VERSION
  end

  before do
    @user = User.new name: 'rob'
  end

  it 'test_form_should_generate' do
    assert do
      expected = '<form action="#" method="post"></form>'
      HexletCode.form_for(@user) {} == expected
    end
    assert do
      expected = '<form action="#" method="post" class="hexlet-form"></form>'
      HexletCode.form_for(@user, class: 'hexlet-form') {} == expected
    end
    assert do
      expected = '<form action="/profile" method="post" class="hexlet-form"></form>'
      HexletCode.form_for(@user, url: '/profile', class: 'hexlet-form') {} == expected
    end
  end
end
