# frozen_string_literal: true

class GroupsController < ApplicationController
  layout 'scaffold'

  # Set group

  before_action :set_group, only: %i[show edit update destroy]

  # Set search

  before_action :set_search, only: %i[show index]

  # GET /groups
  def index
    @groups = if @search

                # Render search results

                Group.search(params[:search], page: params[:page], per_page: 20)

              else

                # Render posts

                Group.all.order('name ASC').page(params[:page])

             end
  end

  # GET /groups/1
  def show
    if @search

      # Render search results

      @posts = Post.search(params[:search], where: { group_id: @group.id }, page: params[:page], per_page: 20)

    else

      # Render Group

      @group = Group.friendly.find(params[:id])

    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups
  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private

  # Set search

  def set_search
    @search = params[:search].present? ? params[:search] : nil
  end

  # Set group

  def set_group
    @group = Group.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def group_params
    params.require(:group).permit(:name)
  end
end
