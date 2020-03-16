# frozen_string_literal: true

class CommentsController < ApplicationController
  layout 'scaffold'

  before_action :post

  before_action :set_comment, only: %i[show edit update destroy like dislike]

  # GET /comments

  def index
    @comments = post.comments.order(created_at: :desc)
  end

  # GET /comments/1

  def show; end

  # GET /comments/new

  def new
    @comment = post.comments.build
  end

  # GET /comments/1/edit

  def edit; end

  # POST /comments

  def create
    @comment = Comment.new(post: post,

                           user: current_user,

                           description: comment_params[:description])

    if @comment.save

      flash[:success] = 'Votre commentaire a été créé avec succès.'

    else

      flash[:danger] = "Votre commentaire n'a pas été créé."

    end

    redirect_to post
  end

  # PATCH/PUT /comments/1

  def update
    if @comment.update(comment_params)

      redirect_to @comment, notice: 'Comment was successfully updated.'

    else

      render :edit

    end
  end

  # DELETE /comments/1

  def destroy
    @comment.destroy

    redirect_to posts_path, notice: 'Votre commentaire a bien été supprimé.'
  end

  def like
    @comment.liked_by current_user

    respond_to do |format|
      format.html { redirect_to posts_path }

      format.js

      format.json
    end
  end

  def dislike
    @comment.disliked_by current_user

    respond_to do |format|
      format.html { redirect_to posts_path }

      format.js

      format.json
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_comment
    @comment = post.comments.find(params[:id])
  end

  def post
    Post.friendly.find(params[:post_id])
  end

  # Only allow a trusted parameter "white list" through.

  def comment_params
    params.require(:comment).permit(:description)
  end
end
