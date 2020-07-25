# frozen_string_literal: true

class BlogsController < ApplicationController
  # Layout

  layout 'statics'

  # Find blog

  before_action :set_blog, only: %i[show edit update destroy]

  # Respong to different formats

  respond_to :js, :html, :json

  # GET /blogs

  def index
    @blogs = Blog.order(created_at: :desc).page(params[:page])

    @blogs_size = Blog.all.size
  end

  # GET /blogs/1

  def show; end

  # GET /blogs/new

  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit

  def edit; end

  # POST /blogs

  def create
    @blog = Blog.new(blog_params)

    if @blog.save

      redirect_to @blog, notice: 'Blog was successfully created.'

    else

      render :new

    end
  end

  # PATCH/PUT /blogs/1

  def update
    if @blog.update(blog_params)

      redirect_to @blog, notice: 'Blog was successfully updated.'

    else

      render :edit

    end
  end

  # DELETE /blogs/1

  def destroy
    @blog.destroy

    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private

  # Set blog

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  # Blog parameters

  def blog_params
    params.require(:blog).permit(
      :title,
      :description,
      :body,
      :cover,
      :created_at,
      :updated_at
    )
  end
end
