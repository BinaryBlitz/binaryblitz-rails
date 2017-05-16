require 'test_helper'

class PriceEstimationTest < ActiveSupport::TestCase
  setup do
    @price_estimation = price_estimations(:price_estimation)
  end

  test 'valid' do
    assert @price_estimation.valid?
  end

  test 'platforms from list' do
    valid_platforms = %w(ios android)
    valid_platforms.each do |platform|
      @price_estimation.platforms = [platform]
      assert @price_estimation.valid?
    end

    @price_estimation.platforms = ['a']
    assert @price_estimation.invalid?
  end

  test 'registration methods from list' do
    valid_registration_methods = %w(phone socials password)
    valid_registration_methods.each do |method|
      @price_estimation.registration_methods = [method]
      assert @price_estimation.valid?
    end

    @price_estimation.registration_methods = ['a']
    assert @price_estimation.invalid?
  end

  test 'notification methods from list' do
    valid_notification_methods = %w(push email sms)
    valid_notification_methods.each do |method|
      @price_estimation.notification_methods = [method]
      assert @price_estimation.valid?
    end

    @price_estimation.notification_methods = ['a']
    assert @price_estimation.invalid?
  end

  test 'communication methods from list' do
    valid_communication_method = %w(phone email)
    valid_communication_method.each do |method|
      @price_estimation.communication_method = method
      assert @price_estimation.valid?
    end

    @price_estimation.communication_method = 'a'
    assert @price_estimation.invalid?
  end

  test 'specification stages from list' do
    valid_specification_stage = %w(complete half-complete none)
    valid_specification_stage.each do |stage|
      @price_estimation.specification_stage = stage
      assert @price_estimation.valid?
    end

    @price_estimation.specification_stage = 'a'
    assert @price_estimation.invalid?
  end
end
