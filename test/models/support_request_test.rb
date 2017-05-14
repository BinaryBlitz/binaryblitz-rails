require 'test_helper'

class SupportRequestTest < ActiveSupport::TestCase
  setup do
    @support_request = support_requests(:support_request)
  end

  test 'valid' do
    assert @support_request.valid?
  end
end
