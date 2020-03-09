json.extract! query, :id, :date, :status, :note, :patient_id, :specialist_id, :created_at, :updated_at
json.url query_url(query, format: :json)
