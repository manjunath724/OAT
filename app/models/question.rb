class Question < ApplicationRecord
  has_and_belongs_to_many :questionnaires

  validates :question, presence: true, uniqueness: true
  validates :allotted_score, presence: true, numericality: { greater_than: 0 }
end
