json.extract! userclient, :id, :client_id, :user_id, :role_id, :state, :created_at, :updated_at
json.url userclient_url(userclient, format: :json)
