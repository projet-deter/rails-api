require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # NAME
  test "Should not save category without name" do
    category = Category.new
    assert_not category.save, "Saved the category without a name"
  end

  test "Should not save category with an empty name" do
    category = Category.new(name: '')
    assert_not category.save, "Saved the category with an empty name"
  end
end
