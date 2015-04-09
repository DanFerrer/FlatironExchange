class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:index, :show, :edit, :update, :create, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    # tags
    # parmas[tags attributes].each do |tag|
    #  tags <<Tag.find_or_create_by(:name => tag)
    # end
    # @question.tags << tags
    # binding.pry
    respond_to do |format|
      if @question.save
        flash[:success] = 'Question was successfully created.'
        format.html { redirect_to @question  }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        flash[:succeess] = 'Question was successfully updated.'

        format.html { redirect_to @question  }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      flash[:success] = 'Question was successfully destroyed.'
      format.html { redirect_to questions_url  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :content, :tag_ids => [], :tags_attributes => [:id, :name]).merge(asker_id: current_user.id)
    end
end
