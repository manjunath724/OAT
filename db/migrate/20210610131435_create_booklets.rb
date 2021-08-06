class CreateBooklets < ActiveRecord::Migration[6.0]
  def change
    create_table :booklets do |t|
      t.references :candidate, null: false, foreign_key: false
      t.references :questionnaire, null: false, foreign_key: true
      t.string :status, default: 'Issued'
      t.integer :rating, default: 0
      t.string :remarks
      t.text :candidate_feedback

      t.timestamps
    end
    add_foreign_key :booklets, :users, column: :candidate_id
  end
end
