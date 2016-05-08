if @message.present?
  json.message @message
else
  json.user do
    json.id @user.id
    json.name @user.name
    json.tel = @user.tel
    json.address = @user.address
    json.created_at = @user.created_at
    json.updated_at = @user.updated_at
    json.category @user.category.try(:name)
  end
end
