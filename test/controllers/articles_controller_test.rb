require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_as(users(:one))
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get article" do
    get article_url(articles(:one))
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: { article: { title: "New Article", body: "This is a new article.", status: "public" } }
    end
    assert_redirected_to article_url(Article.last)
  end

  test "should not create invalid article" do
    assert_no_difference('Article.count') do
      post articles_url, params: { article: { title: "", body: "This is an invalid article." } }
    end
    assert_response :unprocessable_entity
  end

  test "should update article" do
    article = articles(:one)
    patch article_url(article), params: { article: { title: "Updated Title" } }
    assert_redirected_to article_url(article)
    article.reload
    assert_equal "Updated Title", article.title
  end

  test "should not update invalid article" do
    article = articles(:one)
    patch article_url(article), params: { article: { title: "" } }
    assert_response :unprocessable_entity
  end

  test "should destroy article" do
    article = articles(:one)
    assert_difference('Article.count', -1) do
      delete article_url(article)
    end
    assert_redirected_to root_path
  end
end
