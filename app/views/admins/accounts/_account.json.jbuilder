json.extract! account, :id, :number, :amount, :expiry, :created_at, :updated_at
json.url account_url(account, format: :json)
