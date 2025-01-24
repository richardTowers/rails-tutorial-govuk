require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without commenter" do
    comment = Comment.new(body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    refute comment.save, "Saved the comment without a commenter"
  end

  test "should not save comment without body" do
    comment = Comment.new(commenter: "John Doe")
    refute comment.save, "Saved the comment without a body"
  end
end
