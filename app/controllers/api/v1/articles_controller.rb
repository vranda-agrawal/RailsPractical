class Api::V1::ArticlesController < ApplicationController
  before_action :set_article,except: [:index,:create,:search]

  def index 
    @articles=Api::V1::Article.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def destroy
    @article.destroy
  end

  def create 
    @article= Api::V1::Article.create!(article_params)
    render json: @article
  end

  def update
    puts @article.update!(article_params)
    render json: @article
  end

  def search
    @article=Api::V1::Article.find_by(title: params[:title])
    if @article.blank?
      render json: {message:'data not found with this title'}
    else
      render json: @article
    end
  end

  private

  def set_article
    @article=Api::V1::Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description,:release_date)
  end
end
