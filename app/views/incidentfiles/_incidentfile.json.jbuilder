json.extract! incidentfile, :id, :incident_id, :filetype, :state, :created_at, :updated_at
json.url incidentfile_url(incidentfile, format: :json)
