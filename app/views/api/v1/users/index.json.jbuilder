
json.users @users do |user|
  json.(user, :id, :name,  :tel, :address, :created_at, :updated_at)
  json.category (user.category.try :name)
end