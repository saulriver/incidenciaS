json.extract! incidentmanagement, :id, :user_id, :incident_id, :description, :state, :created_at, :updated_at, :page, :search, :picture_url, :picture
json.url incidentmanagement_url(incidentmanagement, format: :json)
