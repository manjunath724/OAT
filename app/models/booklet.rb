class Booklet < ApplicationRecord
  BOOKLET_STATUSES = {
    issued: 'Issued',
    submitted: 'Submitted',
    reviewed: 'Reviewed'
  }.freeze

  belongs_to :candidate
  belongs_to :questionnaire

  has_many :answers

  delegate :questions, to: :questionnaire

  validates :status, presence: true, inclusion: { in: BOOKLET_STATUSES.values }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0 }

  BOOKLET_STATUSES.values.each do |status_name|
    define_method("#{status_name.downcase}?") do
      return status == status_name
    end
  end
end
