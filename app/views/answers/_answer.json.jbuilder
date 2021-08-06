json.extract! answer, :id, :answer, :obtained_score, :question_id, :booklet_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)
