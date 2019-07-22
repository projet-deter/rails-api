require 'test_helper'

class CommentTest < ActiveSupport::TestCase  
  # NAME
  test "Should not save comment without body" do
    comment = Comment.new
    assert_not comment.save, "Saved the comment without a body"
  end

  test "Should not save comment with an empty body" do
    comment = Comment.new(body: '')
    assert_not comment.save, "Saved the comment with an empty body"
  end
end
