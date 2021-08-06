class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ edit update destroy ]

  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.all
  end

  # POST /candidates or /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        set_questionnaire
        format.html { render partial: 'show', status: :created, locals: { candidate: @candidate } }
      else
        format.html { redirect_to candidates_url, alert: @candidate.errors.full_messages.first }
      end
    end
  end

  # PATCH/PUT /candidates/1 or /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        set_questionnaire
        format.html { redirect_to candidates_url, notice: "Candidate was successfully updated." }
      else
        format.html { redirect_to edit_candidate_url(@candidate), alert: @candidate.errors.full_messages.first }
      end
    end
  end

  # DELETE /candidates/1 or /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def set_questionnaire
    return if params[:candidate][:questionnaire_id].blank?
    now = Time.now
    Booklet.upsert({candidate_id: @candidate.id, questionnaire_id: params[:candidate][:questionnaire_id], created_at: now, updated_at: now})
  end

  # Only allow a list of trusted parameters through.
  def candidate_params
    params.require(:candidate).permit(:name, :email)
  end
end
