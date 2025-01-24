require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should be valid" do
    article = Article.new(title: "Title", body: "Body is at least 10 chars")
    assert article.valid?
  end

  test "should be invalid without title" do
    article = Article.new(body: "Body is at least 10 chars")
    refute article.valid?
  end

  test "should be invalid without body" do
    article = Article.new(title: "Title")
    refute article.valid?
  end
end
