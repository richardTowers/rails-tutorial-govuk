require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should be valid" do
    article = Article.new(title: "Title", body: "Body is at least 10 chars")
    assert article.valid?
  end

  test "should be invalid" do
    article = Article.new
    refute article.valid?
  end
end
