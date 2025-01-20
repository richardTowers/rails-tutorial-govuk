require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get article" do
    get article_url(articles(:one))
    assert_response :success
  end
end
