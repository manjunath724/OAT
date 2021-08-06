class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: %i[ edit update destroy ]

  # GET /questionnaires or /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  # POST /questionnaires or /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to questionnaires_url, notice: "Questionnaire was successfully created." }
      else
        # format.html { render :new, status: :unprocessable_entity }
        format.html { redirect_to new_questionnaire_url, alert: @questionnaire.errors.full_messages.first }
      end
    end
  end

  # PATCH/PUT /questionnaires/1 or /questionnaires/1.json
  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to questionnaires_url, notice: "Questionnaire was successfully updated." }
      else
        format.html { redirect_to edit_questionnaire_url(@questionnaire), alert: @questionnaire.errors.full_messages.first }
      end
    end
  end

  # DELETE /questionnaires/1 or /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: "Questionnaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def questionnaire_params
      params.require(:questionnaire).permit(:title, { question_ids: [] })
    end
end
