require 'test_helper'

class SupportRequestMailerTest < ActionMailer::TestCase
  setup do
    @support_request = support_requests(:support_request)
  end

  test 'new support_request' do
    email = SupportRequestMailer.new_support_request(@support_request)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['noreply@binaryblitz.ru'], email.from
    assert_equal ['foo@bar.com'], email.to
    assert_equal "Запрос на обработку №#{@support_request.id}", email.subject
  end
end
