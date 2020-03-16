# frozen_string_literal: true

class PostsController < ApplicationController
  layout 'scaffold'

  before_action :set_post, only: %i[show edit update destroy like dislike]

  before_action :user, only: %i[show]

  # GET /posts

  def index
    @posts = if params[:search].present?

               Post.perform_search(params[:search])

             else

               Post.order(created_at: :desc)

             end

    @posts = @posts.order(created_at: :desc).page(params[:page])

    respond_to do |format|
      format.js

      format.html
    end
  end

  # GET /posts/1

  def show; end

  # GET /posts/new

  def new
    @post = Post.new
  end

  # GET /posts/1/edit

  def edit; end

  # POST /posts

  def create
    @post = current_user.posts.create!(post_params)

    respond_to do |format|
      if @post.save

        format.html do
          redirect_to root_path, notice: 'Votre publication a bien été ajoutée.'
        end

      else

        format.html do
          flash[:danger] = "Votre publication n'a pas été ajoutée : #{

          @post.errors.messages

        }"
        end

        render :new

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

      format.js

      format.json { head :no_content }
    end
  end

  def like
    @post.liked_by current_user

    respond_to do |format|
      format.html { redirect_to :back }

      format.js

      format.json
    end
  end

  def dislike
    @post.disliked_by current_user

    respond_to do |format|
      format.html { redirect_to :back }

      format.js

      format.json
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def user
    @user = @post.user
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.

  def post_params
    params.require(:post).permit(
      :title,
      :description,
      :created_at,
      :updated_at,
      :file,
      :tag_list
    )
  end
end
