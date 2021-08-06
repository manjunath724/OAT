class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :booklet

  validates :question_id, uniqueness: { scope: :booklet_id, message: "was already answered" }
  validates :obtained_score, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
