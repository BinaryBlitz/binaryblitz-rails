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

  test 'phone number format' do
    @callback_request.phone_number = '1'
    assert @callback_request.invalid?

    @callback_request.phone_number = '+79998887766'
    assert @callback_request.valid?
  end
end
