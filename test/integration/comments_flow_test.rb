require "test_helper"

class CommentsFlowTest < ActionDispatch::IntegrationTest
  test "can create a comment" do
    article = articles(:no_comments)
    get article_url(article)
    assert_response :success

    assert_difference('article.comments.count') do
      post article_comments_url(article), params: { comment: { commenter: "Daffy Duck", body: "Quack! Quack! Quack!" } }
    end

    assert_redirected_to article_url(article)
    follow_redirect!

    assert_select "p.comment_commenter", /Daffy Duck/
    assert_select "p.comment_body", /Quack! Quack! Quack!/
  end

  test "can destroy a comment" do
    article = articles(:one)
    comment = article.comments.create!(commenter: "Daffy Duck", body: "Quack! Quack! Quack!")
    assert_difference('article.comments.count', -1) do
      delete article_comment_url(article, comment)
    end

    assert_redirected_to article_url(article)
  end
end