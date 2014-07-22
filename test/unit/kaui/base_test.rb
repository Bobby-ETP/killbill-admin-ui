require 'test_helper'

class Kaui::BaseTest < ActiveSupport::TestCase

  test 'can convert to money' do
    # Happy path
    %w(GBP MXN BRL EUR AUD USD CAD JPY).each do |currency|
      money = Kaui::Base.to_money(12.42, currency)
      assert_equal 1242, money.cents
      assert_equal currency, money.currency.iso_code
    end

    # Edge cases
    bad_money = Kaui::Base.to_money(12.42, 'blahblah')
    assert_equal 1242, bad_money.cents
    assert_equal 'USD', bad_money.currency.iso_code
  end
end
