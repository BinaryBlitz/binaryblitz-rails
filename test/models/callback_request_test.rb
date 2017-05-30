require 'test_helper'

class CallbackRequestTest < ActiveSupport::TestCase
  setup do
    @callback_request = callback_requests(:callback_request)
  end

  test 'valid' do
    assert @callback_request.valid?
  end

  test 'invalid without name' do
    @callback_request.name = nil
    assert @callback_request.invalid?
  end
end
