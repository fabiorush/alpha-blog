require 'test_helper'

class CategoriesControlleTest < ActionDispatch::IntegrationTest

  def setup
    @password = "12345678"
    @admin = User.create(username: "admin", email: "admin@urquiza.org", password: @password, admin: true)
  end

  test "should get categories index"  do
    get categories_path
    assert_response :success
  end

  test "should get categories new"  do
    sign_in_as(@admin, @password)
    get new_category_path
    assert_response :success
  end

  test "should get categories show"  do
    category = Category.create(name: "sports")
    get category_path(category)
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: "sports"}}
    end
    assert_redirected_to categories_path
  end
end