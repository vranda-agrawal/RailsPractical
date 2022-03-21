class Api::V1::ArticleCommentsController < ApplicationController
  before_action :set_article_comment,except: [:index,:create,:search]

  def index 
    @article_comments=Api::V1::ArticleComment.all
    render json: @article_comments
  end

  def show
    render json: @article_comment
  end

  def destroy
    @article_comment.destroy
  end

  def create 
    @article_comment= Api::V1::ArticleComment.create!(article_comment_params)
    render json: @article_comment
  end

  def search
    @article_comment=Api::V1::ArticleComment.find_by(comment: params[:comment])
    if @article_comment.blank?
      render json: {message:'data not found with this comment'}
    else
      render json: @article_comment
    end
  end

  def update
    @article_comment.update!(article_comment_params)
    render json: @article_comment
  end

  private

  def set_article_comment
    @article_comment=Api::V1::ArticleComment.find(params[:id])
  end

  def article_comment_params
    params.require(:article_comment).permit(:comment,:date_of_comment,:article_id)
  end
end
