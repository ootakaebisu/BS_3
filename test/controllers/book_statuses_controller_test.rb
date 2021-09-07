require 'test_helper'

class BookStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_statuses_index_url
    assert_response :success
  end

end
