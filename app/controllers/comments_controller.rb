class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to @article
    else
      @new_comment = @comment
      render 'articles/show', status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, status: :see_other
  end

private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
