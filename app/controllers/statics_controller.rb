class StaticsController < ApplicationController
  layout "scaffold"

  before_action :set_static, only: [:show, :edit, :update, :destroy]

  # GET /statics
  def index
    @statics = Static.all
  end

  # GET /statics/1
  def show
  end

  # GET /statics/new
  def new
    @static = Static.new
  end

  # GET /statics/1/edit
  def edit
  end

  # POST /statics
  def create
    @static = Static.new(static_params)

    if @static.save
      redirect_to @static, notice: 'Static was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /statics/1
  def update
    if @static.update(static_params)
      redirect_to @static, notice: 'Static was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /statics/1
  def destroy
    @static.destroy
    redirect_to statics_url, notice: 'Static was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_static
      @static = Static.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def static_params
      params.fetch(:static, {})
    end
end
