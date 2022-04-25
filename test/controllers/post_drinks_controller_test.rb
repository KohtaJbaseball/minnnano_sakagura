require "test_helper"

class PostDrinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_drinks_index_url
    assert_response :success
  end

  test "should get show" do
    get post_drinks_show_url
    assert_response :success
  end

  test "should get new" do
    get post_drinks_new_url
    assert_response :success
  end

  test "should get edit" do
    get post_drinks_edit_url
    assert_response :success
  end
end
