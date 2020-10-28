# frozen_string_literal: true

class TagsController < ApplicationController
  # Layout

  layout 'scaffold'

  # Find tag

  before_action :set_tag, only: %i[show]

  before_action :set_search, only: %i[index show]

  # GET /tags

  def index
    @tags = if @search

              # Render search results

              Tag.search(params[:search], page: params[:page], per_page: 20)

            else

              # Render tags

              Tag.all.order('title ASC').page(params[:page])

            end
  end

  # GET /tags/1

  def show
    @posts = @tag.posts.order(created_at: :desc).page(params[:page])

    respond_to do |format|
      format.js

      format.html
    end
  end

  # DELETE /tags/1

  def destroy
    @tag.destroy

    redirect_to tags_url, notice: 'Tag was successfully destroyed.'
  end

  private

  # Set search

  def set_search
    @search = params[:search].present? ? params[:search] : nil
  end

  # Set tag

  def set_tag
    @tag = Tag.friendly.find(params[:id])
    authorize @tag
  end
end
