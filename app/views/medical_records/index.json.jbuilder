json.array!(@medical_records) do |medical_record|
  json.extract! medical_record, :serial_number, :patient, :creator, :reviewer, :content
  json.url medical_record_url(medical_record, format: :json)
end
