class HomeController < ApplicationController
  # GET /home or /root_url
  def index
    if current_user.employer?
      @booklets = Booklet.all
    else
      @booklet = current_user.booklet
      if @booklet&.issued?
        @questions = @booklet.questions
        @answers = @booklet.answers
      end
    end

    render "home/#{current_user.type.downcase}"
  end
end
