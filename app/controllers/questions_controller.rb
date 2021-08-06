class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        # format.html { redirect_to @question, notice: "Question was successfully created." }
        # format.html { render :show, status: :created, location: @question }
        format.html { render partial: 'show', status: :created, locals: { question: @question } }
      else
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @question.errors, status: :unprocessable_entity }
        format.html { redirect_to questions_url, alert: @question.errors.full_messages.first }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to questions_url, notice: "Question was successfully updated." }
        # format.json { render :show, status: :ok, location: @question }
      else
        format.html { redirect_to edit_question_url(@question), alert: @question.errors.full_messages.first }
        # format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question, :allotted_score)
    end
end
