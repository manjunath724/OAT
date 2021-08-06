class BookletsController < ApplicationController
  before_action :set_booklet, only: %i[ update show ]

  # PATCH/PUT /booklets/1 or /booklets/1.json
  def update
    if current_user.candidate?
      @booklet.update(status: 'Submitted') if @booklet&.issued?
      msg = 'Submitted'
    else
      @booklet.update(status: 'Reviewed') if @booklet&.submitted?
      msg = 'Reviewed'
    end

    redirect_to root_url, notice: "You have successfully #{msg} the Test."
  end

  # GET /booklets/1 or /booklets/1.json
  def show
    if @booklet&.submitted?
      @questions = @booklet.questions
      @answers = @booklet.answers
    end

    render "home/candidate"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booklet
    @booklet = Booklet.find(params[:id])
  end
end