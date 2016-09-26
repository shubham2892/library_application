require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "is room path" do
    get rooms_path
    assert response: success
  end
end
