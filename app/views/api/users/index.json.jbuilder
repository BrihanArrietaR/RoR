json.array! @users do |user|

    json.id user.id
    json.name user.name
    json.address user.address
    json.role user.role
    json.email user.email

end
