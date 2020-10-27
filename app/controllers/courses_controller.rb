class CoursesController < ApplicationController
  layout 'scaffold'

  # Set course

  before_action :set_course, only: %i[show edit update destroy]

  # Set search

  before_action :set_search, only: %i[show index]

  # GET /courses

  def index
    @courses = if @search

                # Render search results

                Course.search(params[:search], page: params[:page], per_page: 20)

              else

                # Render courses

                Course.all.order('name ASC').page(params[:page])

              end
  end

  # GET /courses/1

  def show
    @posts = if @search

               # Render search results

               Post.search(
                 params[:search],
                 where: { course_id: @course.id },

                 page: params[:page],

                 per_page: 20
               )

             else

               # Render course

               @course.posts.page(params[:page])

             end
  end

  # GET /courses/new

  def new
    @course = Course.new
  end

  # GET /courses/1/edit

  def edit; end

  # POST /courses

  def create
    @course = Course.new(course_params)

    if @course.save

      redirect_to @course, notice: 'Course was successfully created.'

    else

      render :new

    end
  end

  # PATCH/PUT /courses/1

  def update
    if @course.update(course_params)

      redirect_to @course, notice: 'Course was successfully updated.'

    else

      render :edit

    end
  end

  # DELETE /courses/1

  def destroy
    @course.destroy

    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private

  # Set search

  def set_search
    @search = params[:search].present? ? params[:search] : nil
  end

  # Set course

  def set_course
    @course = Course.friendly.find(params[:id])
    authorize @course
  end

  # Course parameters

  def course_params
    params.require(:course).permit(:name)
  end
end
