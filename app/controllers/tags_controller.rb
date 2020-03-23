# frozen_string_literal: true

class TagsController < ApplicationController
  layout 'scaffold'

  before_action :authenticate_user!

  before_action :set_tag, only: [:show]

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

  def set_tag
    @tag = Tag.friendly.find(params[:id])
  end
end
