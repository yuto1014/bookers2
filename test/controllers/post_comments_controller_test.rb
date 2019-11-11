require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get post_comments_create_url
    assert_response :success
  end

  test "should get edit" do
    get post_comments_edit_url
    assert_response :success
  end

end
