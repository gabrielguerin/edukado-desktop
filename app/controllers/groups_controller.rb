class GroupsController < ApplicationController
  layout "scaffold"

  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  def index
    @groups = Group.all
  end

  # GET /groups/1
  def show
    @search = params[:search].present? ? params[:search] : nil

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
  def edit
  end

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

  # Set groups

  def groups
    @groups = Group.all.order(created_at: :desc).page(params[:page])
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
