require 'test_helper'

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reservation_new_url
    assert_response :success
  end

  test "should get destroy" do
    get reservation_destroy_url
    assert_response :success
  end

end
