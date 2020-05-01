# frozen_string_literal: true

class CommentsController < ApplicationController
  layout 'scaffold'

  before_action :set_post

  before_action :authenticate_user!

  before_action :set_comment, only: %i[

    show

    edit

    update

    destroy

    like

    unlike

    dislike

    undislike

  ]

  respond_to :js, :html, :json

  # GET /comments/new

  def new
    @comment = @post.comments.build
  end

  # GET /comments/1/edit

  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /comments

  def create
    @comment = @post.comments.build(
      comment_params
    )

    if @comment.save

      flash[:success] = 'Votre commentaire a été créé avec succès.'

    else

      flash[:danger] = "Votre commentaire n'a pas été créé."

    end

    redirect_to @post
  end

  # PATCH/PUT /comments/1

  def update
    if @comment.update!(
      comment_params
    )

      respond_to do |format|
        format.html { redirect_to @post }

        format.js
      end

    else

      flash[:alert] = 'Votre commentaire n\'a pas pu être modifié, veuillez essayer à nouveau.'

      redirect_to @post

  end
  end

  # DELETE /comments/1

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html do
        redirect_to :back,
                    notice: 'Votre commentaire a bien été supprimé.'
      end

      format.json { head :no_content }

      format.js   { render layout: false }
    end
  end

  def like
    if @comment.user != current_user

      @comment.liked_by current_user

      if @comment.save!

        flash.now[:notice] = 'You have successfuly upvoted this comment.'

      else

        flash.now[:error] = 'Could not upvote this comment.'

      end

    else

      flash.now[:error] = 'You cannot upvote your own comment.'

    end
  end

  def unlike
    @comment.unliked_by current_user if @comment.user != current_user
  end

  def dislike
    if @comment.user != current_user

      @comment.disliked_by current_user

      if @comment.save!

        flash.now[:notice] = 'You have successfuly downvoted this comment.'

      else

        flash.now[:error] = 'Could not downvote this comment.'

      end

    else

      flash.now[:error] = 'You cannot downvote your own comment.'

    end
  end

  def undislike
    @comment.undisliked_by current_user if @comment.user != current_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  # Only allow a trusted parameter "white list" through.

  def comment_params
    params.require(:comment).permit(:description, :post_id).merge(
      user: current_user
    )
  end
end
