class StoriesController < ApplicationController
  before_action :set_story, only: %i[ show edit update destroy ]

  # GET /stories or /stories.json
  def index
    @user = User.find(params[:user_id])
    # @stories = @user.stories.all
  end

  # GET /stories/1 or /stories/1.json
  def show
    # @story = Story.find(params[:id])
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories or /stories.json
  def create
    @story = current_user.stories.create(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to user_stories_path}
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new, status: :unprocessable_entity,  alert: "Something went wrong" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1 or /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to story_url(@story), notice: "Story was successfully updated." }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1 or /stories/1.json
  def destroy
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url, notice: "Story was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def story_params
      params.require(:story).permit(:image)
    end
end
