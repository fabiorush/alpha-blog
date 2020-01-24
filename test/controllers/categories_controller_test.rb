require 'test_helper'

class CategoriesControlleTest < ActionDispatch::IntegrationTest

  test "should get categories index"  do
    get categories_path
    assert_response :success
  end

  test "should get categories new"  do
    get new_category_path
    assert_response :success
  end

  test "should get categories show"  do
    category = Category.create(name: "sports")
    get category_path(category)
    assert_response :success
  end
end