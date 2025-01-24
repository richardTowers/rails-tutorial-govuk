require "test_helper"

class ArticlesFlowTest < ActionDispatch::IntegrationTest
  include AuthenticationHelpers

  test "can see the articles index" do
    get articles_url
    assert_response :success
    assert_select "h1", "Articles"
  end

  test "can create an article" do
    log_in_as(users(:one))
    get new_article_url
    assert_response :success

    assert_difference('Article.count') do
      post articles_url, params: { article: { title: "New Article", body: "This is a new article.", status: "public" } }
    end

    assert_redirected_to article_url(Article.last)
    follow_redirect!
    assert_select "h1", "New Article"
  end

  test "can update an article" do
    log_in_as(users(:one))
    article = articles(:one)
    get edit_article_url(article)
    assert_response :success

    patch article_url(article), params: { article: { title: "Updated Title" } }
    assert_redirected_to article_url(article)
    follow_redirect!
    assert_select "h1", "Updated Title"
  end

  test "can destroy an article" do
    log_in_as(users(:one))
    article = articles(:one)
    assert_difference('Article.count', -1) do
      delete article_url(article)
    end

    assert_redirected_to root_url
  end
end
