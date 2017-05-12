require 'test_helper'

class CallbackRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @callback_request = callback_requests(:callback_request)
  end

  test 'should create callback_request' do
    @callback_request.destroy

    assert_difference 'CallbackRequest.count' do
      post callback_requests_path, params: {
        callback_request: @callback_request.attributes
      }
    end
  end
end
