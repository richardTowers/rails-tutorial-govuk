require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should be invalid without commenter" do
    comment = Comment.new(body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    assert comment.invalid?
  end

  test "should be invalid without body" do
    comment = Comment.new(commenter: "John Doe")
    assert comment.invalid?
  end
end
