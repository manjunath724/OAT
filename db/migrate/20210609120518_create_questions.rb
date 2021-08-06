class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :allotted_score, default: 1

      t.timestamps
    end
  end
end
