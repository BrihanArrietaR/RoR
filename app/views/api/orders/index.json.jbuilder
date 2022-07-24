json.array! @orders do |order|

    json.id order.id
    json.date order.date
    json.state order.state
    json.user_id order.user_id
    json.dish_id order.dish_id

end