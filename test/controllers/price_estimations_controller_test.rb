require 'test_helper'

class PriceEstimationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_estimation = price_estimations(:price_estimation)
  end

  test 'should get price estimation page' do
    get calculator_path
    assert_response :success
  end

  test 'should create price estimation' do
    assert_difference 'PriceEstimation.count' do
      post price_estimations_path, params: {
        price_estimation: @price_estimation.attributes
      }
    end
    assert_redirected_to calculator_path
  end
end
