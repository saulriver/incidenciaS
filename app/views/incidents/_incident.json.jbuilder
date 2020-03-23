json.extract! incident, :id, :area_id, :userapplication_id, :user_id, :criticality_id, :description, :state, :created_at, :updated_at
json.url incident_url(incident, format: :json)
