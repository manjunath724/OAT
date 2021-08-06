class CreateJoinTableQuestionsQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_join_table :questions, :questionnaires do |t|
      # t.index [:question_id, :questionnaire_id]
      # t.index [:questionnaire_id, :question_id]
    end
  end
end
