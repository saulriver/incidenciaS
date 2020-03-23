json.extract! user, :id, :name, :mail, :role_id, :username, :password, :change_password, :state, :created_at, :updated_at
json.url user_url(user, format: :json)
