require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test 'invalid without building' do
    room = Room.new(building: 'James. B. Hunt')
    refute room.valid?, 'user is valid without a name'
    assert_not_nil room.errors[:building], 'no validation error for name present'
  end

  test 'invalid without size' do
  end

  test 'invalid without unique room_number' do
  end
end
