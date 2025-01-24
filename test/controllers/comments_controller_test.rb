require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should create comment" do
    article = articles(:one)
    assert_difference -> { article.comments.count } do
      post article_comments_url(article), params: { comment: { commenter: "Daffy Duck", body: "Quack! Quack! Quack!" } }
    end

    assert_redirected_to article_url(article)
  end

  test "should not create invalid comments" do
    article = articles(:one)
    assert_no_difference -> { article.comments.count } do
      post article_comments_url(article), params: { comment: { commenter: "Daffy Duck" } }
    end

    assert_response :unprocessable_entity
  end

  test "should destroy comment" do
    article = articles(:one)
    comment = article.comments.create!(commenter: "Daffy Duck", body: "Quack! Quack! Quack!")
    assert_difference -> { article.comments.count }, -1 do
      delete article_comment_url(article, comment)
    end
    assert_redirected_to article_url(article)
  end
end