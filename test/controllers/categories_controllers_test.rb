require 'test_helper'


class CategoriesControllerTest < ActionDispatch::IntegrationTest

	test "should get categories index #" do
		get categories_url
		assert_response :success
	end

	test "should get new #" do
		get '/categories/new'
		assert_response :success
	end

	test "should get show #" do

		get categories_url,params: { id: 1 }
		assert_response :success
	end
end