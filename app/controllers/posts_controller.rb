# frozen_string_literal: true

class PostsController < ApplicationController
  # Layout

  layout 'scaffold'

  # Authenticate user

  before_action :authenticate_user!, except: %i[show index autocomplete]

  # Find post

  before_action :set_post, only: %i[

    show

    edit

    update

    destroy

    like

    unlike

    dislike

    undislike

  ]

  # Find posts

  before_action :posts, only: %i[show create]

  # Respond to different formats

  respond_to :js, :html, :json

  # GET /posts

  def index
    search = params[:search].present? ? params[:search] : nil

    @posts = if search

               # Render search results

               Post.search(params[:search], page: params[:page], per_page: 20)

             else

               # Render posts

               Post.all.order(created_at: :desc).page(params[:page])

             end
  end

  # GET /posts/1

  def show
    @user = @post.user

    @comment = @post.comments.new

    impressionist(@post)
  end

  # GET /posts/new

  def new
    @post = Post.new
  end

  # GET /posts/1/edit

  def edit; end

  # POST /posts

  def create
    @post = Post.new(post_params)

    @comment = Comment.new

    respond_to do |format|
      if @post.save

        format.html do
          redirect_to @post, notice: 'Votre publication a bien été ajoutée.'
        end

        format.json { render :show, status: :created, location: @post }

      else

        format.html { render :new }

        format.json { render json: @post.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /posts/1

  def update
    if @post.update(post_params)

      redirect_to @post, notice: 'Post was successfully updated.'

    else

      render :edit

    end
  end

  # DELETE /posts/1

  def destroy
    @post.destroy

    respond_to do |format|
      format.html do
        redirect_to :back,
                    notice: 'Votre publication a bien été supprimé.'
      end

      format.json { head :no_content }

      format.js   { render layout: false }
    end
  end

  # Like post

  def like
    if @post.user != current_user

      @post.liked_by current_user

      if @post.save!

        create_notification @post

      else

        flash.now[:error] = "Could not upvote this #{@post.title}"

      end

    else

      flash.now[:error] = 'You cannot upvote your own post.'

    end
  end

  # Unlike post

  def unlike
    @post.unliked_by current_user if @post.user != current_user
  end

  # Dislike post

  def dislike
    if @post.user != current_user

      @post.disliked_by current_user

      if @post.save!

      else

        flash.now[:error] = "Could not downvote this #{@post.title}"

      end

    else

      flash.now[:error] = 'You cannot downvote your own post.'

    end
  end

  # Undislike post

  def undislike
    @post.undisliked_by current_user if @post.user != current_user
  end

  # Autocomplete search results

  def autocomplete
    render json: Post.search(params[:search], {

                               fields: %w[title],

                               match: :word_start,

                               limit: 10,

                               load: false,

                               misspellings: { below: 5 }
                             }).map(&:title)
  end

  private

  # Set posts

  def posts
    @posts = Post.all.order(created_at: :desc).page(params[:page])
  end

  # Set post

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  # Create notification when post is liked

  def create_notification(post)
    return if post.user.id == current_user.id

    Notification.create(user_id: post.user.id,

                        notified_by_id: current_user.id,

                        post_id: post.id,

                        identifier: post.id,

                        notice_type: 'aimé')
  end

  # Post parameters

  def post_params
    params.require(:post).permit(
      :title,
      :description,
      :created_at,
      :updated_at,
      :file,
      :tag_list
    ).merge(
      user: current_user
    )
  end
end
