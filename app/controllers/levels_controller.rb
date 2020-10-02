class LevelsController < ApplicationController
  layout 'scaffold'

  # Set level

  before_action :set_level, only: %i[show edit update destroy]

  # GET /levels

  def index
    @search = params[:search].present? ? params[:search] : nil

    @levels = if @search

               # Render search results

               Level.search(params[:search], page: params[:page], per_page: 20)

             else

               # Render posts

               Level.all.order(created_at: :desc).page(params[:page])

             end
  end

  # GET /levels/1

  def show; end

  # GET /levels/new
 
  def new
    @level = Level.new
  end

  # GET /levels/1/edit

  def edit; end

  # POST /levels
  
  def create
    @level = Level.new(level_params)

    if @level.save
      redirect_to @level, notice: 'Level was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /levels/1
  
  def update
    if @level.update(level_params)
      redirect_to @level, notice: 'Level was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /levels/1
  
  def destroy
    @level.destroy
    redirect_to levels_url, notice: 'Level was successfully destroyed.'
  end

  private

    # Set level
  
    def set_level
      @level = Level.friendly.find(params[:id])
    end

    # Level parameters
    
    def level_params
      params.require(:level).permit(:level)
    end
end
