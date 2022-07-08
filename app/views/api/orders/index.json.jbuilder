json.array! @orders do |order|

    json.id order.id
    json.date order.date
    json.state order.state
    json.user order.user

end