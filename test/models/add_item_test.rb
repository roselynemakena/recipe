require 'test_helper'


class AddItemTest < ActiveSupport::TestCase

	def setup
		@item = Item.create(name: "salt")
	end

	test "should create new item" do
		assert @item.valid?
	end
end