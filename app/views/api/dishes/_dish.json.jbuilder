json.extract! dish, :id, :name, :description, :price, :created_at, :updated_at
json.url dish_url(dish, format: :json)
