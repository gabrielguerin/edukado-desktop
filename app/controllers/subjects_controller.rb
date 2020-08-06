class SubjectsController < ApplicationController
  layout "scaffold"

  # Set group

  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # Set search

  before_action :set_search, only: %i[show index]

  # GET /subjects

  def index
    @subjects = if @search

      # Render search results

      Subject.search(params[:search], page: params[:page], per_page: 20)

    else

      # Render subjects

      Subject.all.order('name ASC').page(params[:page])

    end
  end

  # GET /subjects/1

  def show
    if @search

      # Render search results

      @posts = Post.search(
        params[:search],
        
        where: { subject_id: @subject.id },

        page: params[:page],

        per_page: 20
      )

    else

      # Render Subject

      @subject = Subject.friendly.find(params[:id])

      @posts = @subject.posts.page(params[:page])

    end
  end

  # GET /subjects/new

  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit

  def edit; end

  # POST /subjects

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to @subject, notice: 'Subject was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /subjects/1

  def update
    if @subject.update(subject_params)
      redirect_to @subject, notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subjects/1

  def destroy
    @subject.destroy
    redirect_to subjects_url, notice: 'Subject was successfully destroyed.'
  end

  private

  # Set search

  def set_search
    @search = params[:search].present? ? params[:search] : nil
  end

  # Set subject

  def set_subject
    @subject = Subject.friendly.find(params[:id])
  end

  # Subject parameters

  def subject_params
    params.require(:subject).permit(:name)
  end
end
