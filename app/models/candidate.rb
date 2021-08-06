class Candidate < User
  has_one :booklet
  has_one :questionnaire, through: :booklet

  delegate :id, to: :questionnaire, prefix: true, allow_nil: true
end
