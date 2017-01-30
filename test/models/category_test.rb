require 'test_helper'
class CategoryTest < ActiveSupport::TestCase

	def setup
		@category = Category.new(name: "stews")
		
	end

	test "category should b valid" do
		assert @category.valid?
	end

	test "name shuld be there" do
		@category.name = " "
		assert_not @category.valid?
	end

	test "name should be uniq" do
		@category.save

		@category2 = Category.new(name: "stews")
		assert_not @category2.valid?
	end

	test "name shudnt be too long" do
		@category.name = "a"*30

		assert_not @category.valid?
	end

		test "name shudnt be too short" do
		@category.name = "aa"

		assert_not @category.valid?
	end
end