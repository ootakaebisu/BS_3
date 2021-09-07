require 'test_helper'

class FavoriteAuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorite_authors_index_url
    assert_response :success
  end

end
