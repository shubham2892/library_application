require 'test_helper'

class ReservationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post :create, reservation: {room_id: @reservation.room_id, member_id: @reservation.member_id, starttime: @reservation.starttime}
    end
    assert_redirected_to reservations_path(assigns(:reservation))
  end

end
