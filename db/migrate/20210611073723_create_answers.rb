class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :answer
      t.float :obtained_score, default: 0
      t.references :question, null: false, foreign_key: true
      t.references :booklet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
