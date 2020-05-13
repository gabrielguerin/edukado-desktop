# frozen_string_literal: true

class CommentsController < ApplicationController
  # Layout

  layout 'scaffold'

  # Find post

  before_action :set_post

  # Authenticate user

  before_action :authenticate_user!

  # Find comment

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

  # Respond to different formats

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

    respond_to do |format|
      if @comment.save

        create_notification @post, @comment

        format.html { redirect_to @post, notice: 'Votre commentaire a été créé avec succès.' }

        format.json { render :show, status: :created, location: @post }

      else

        format.html { render :new }

        format.json { render json: @post.errors, status: :unprocessable_entity }

      end

      format.js
    end
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

  # Like comment

  def like
    if @comment.user != current_user

      @comment.liked_by current_user

      if @comment.save!

      else

        flash.now[:error] = 'Could not upvote this comment.'

      end

    else

      flash.now[:error] = 'You cannot upvote your own comment.'

    end
  end

  # Unlike comment

  def unlike
    @comment.unliked_by current_user if @comment.user != current_user
  end

  # Dislike comment

  def dislike
    if @comment.user != current_user

      @comment.disliked_by current_user

      if @comment.save!

      else

        flash.now[:error] = 'Could not downvote this comment.'

      end

    else

      flash.now[:error] = 'You cannot downvote your own comment.'

    end
  end

  # Undislike comment

  def undislike
    @comment.undisliked_by current_user if @comment.user != current_user
  end

  private

  # Set comment

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  # Set post

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end

  # Create notification when commenting on a post

  def create_notification(post, comment)
    return if post.user.id == current_user.id

    Notification.create(user_id: post.user.id,

                        notified_by_id: current_user.id,

                        post_id: post.id,

                        identifier: comment.id,

                        notice_type: 'commenté')
  end

  # Comment parameters

  def comment_params
    params.require(:comment).permit(:description, :post_id).merge(
      user: current_user
    )
  end
end
