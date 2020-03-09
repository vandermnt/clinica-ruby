json.extract! patient, :id, :name, :cpf, :age, :telefone, :email, :address, :profession, :created_at, :updated_at
json.url patient_url(patient, format: :json)
