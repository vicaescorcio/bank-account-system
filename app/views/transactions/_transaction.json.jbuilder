json.extract! transaction, :id, :tr_type, :tr_date, :valor, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
