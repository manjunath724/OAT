class Questionnaire < ApplicationRecord
  has_many :booklets
  has_many :candidates, through: :booklets
  has_and_belongs_to_many :questions

  validates :title, presence: true, uniqueness: true
end
