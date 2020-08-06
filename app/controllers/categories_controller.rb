# frozen_string_literal: true

class CategoriesController < ApplicationController
  layout 'scaffold'

  # Set category

  before_action :set_category, only: %i[show edit update destroy]

  # Set search

  before_action :set_search, only: %i[show index]

  # GET /categories

  def index
    @categories = if @search

                    # Render search results

                    Category.search(params[:search], page: params[:page], per_page: 20)

                  else

                    # Render categories

                    Category.all.order('name ASC').page(params[:page])

                  end
  end

  # GET /categories/1

  def show
    if @search

      # Render search results

      @posts = Post.search(
        params[:search],

        where: { category_id: @category.id },

        page: params[:page],

        per_page: 20
      )

    else

      # Render Category

      @posts = @category.posts.page(params[:page])

    end
  end

  # GET /categories/new

  def new
    @category = Category.new
  end

  # GET /categories/1/edit

  def edit; end

  # POST /categories

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  # Set search

  def set_search
    @search = params[:search].present? ? params[:search] : nil
  end

  # Set category

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  # Category parameters

  def category_params
    params.require(:category).permit(:name)
  end
end
