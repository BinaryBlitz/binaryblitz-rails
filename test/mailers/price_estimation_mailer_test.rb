require 'test_helper'

class PriceEstimationMailerTest < ActionMailer::TestCase
  setup do
    @price_estimation = price_estimations(:price_estimation)
  end

  test 'new price_estimation' do
    email = PriceEstimationMailer.new_price_estimation(@price_estimation)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['noreply@binaryblitz.ru'], email.from
    assert_equal ['foo@bar.com'], email.to
    assert_equal "Заказ на оценку стоимости №#{@price_estimation.id}", email.subject
  end
end
