json.extract! project, :id, :title, :description, :manager_name, :state, :created_at, :updated_at
json.url project_url(project, format: :json)
