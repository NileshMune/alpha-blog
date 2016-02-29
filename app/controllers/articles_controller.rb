class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  def create 
    @article = Article.new(article_params)
    @article.save
    # redirect to show template
    redirect_to articles_show(@article)
  end
  
  private
  def article_params
    params.require(:article).permit(:title,:desc)
  end
end