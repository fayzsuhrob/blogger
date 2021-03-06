class ArticlesController < ApplicationController
  include ArticlesHelper

    before_action :authenticated, except: [:show, :index]

    def authenticated
      unless current_user
        redirect_to root_path
        flash.notice = "You should be logged in to complete this action"    
        return false
      end
    end
    
    def index
        @articles = Article.all
      end

    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
     end

     def new
        @article = Article.new
     end

     def create
      @article = Article.new(article_params)
      @article.save
      redirect_to article_path(@article)
      flash.notice = "Article '#{@article.title}' created!"
    end

    def destroy
      @article = Article.find(params[:id]).destroy
      redirect_to action: "index"
      flash.notice = "Article '#{@article.title}' destroyed!"
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
      @article.update(article_params)
      flash.notice = "Article '#{@article.title}' Updated!"    
      redirect_to article_path(@article)
    end

end
