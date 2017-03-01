json.extract! employee, :id, :name, :email, :password_digest, :admin, :company_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
