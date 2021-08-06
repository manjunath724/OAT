class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ edit update destroy ]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)

    validate_booklet

    respond_to do |format|
      if @answer.save
        format.html { render partial: 'show', status: :created, locals: { answer: @answer } }
      else
        format.html { redirect_to root_url, alert: @answer.errors.full_messages.first }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    validate_booklet
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to root_url, notice: "Answer was successfully updated." }
      else
        format.html { redirect_to edit_answer_url(@answer), alert: @answer.errors.full_messages.first }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def validate_booklet
      unless @answer.booklet.issued?
        redirect_to root_url, alert: "Test was already Submitted"
      end
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:answer, :obtained_score, :question_id, :booklet_id)
    end
end
