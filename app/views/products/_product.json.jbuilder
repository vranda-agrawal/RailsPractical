json.extract! product, :id, :name, :brand, :quantity, :cost, :created_at, :updated_at
json.url product_url(product, format: :json)
