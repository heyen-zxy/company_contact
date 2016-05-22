class AddColumnsToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :login, :string
    add_column :admins, :role, :integer
  end
end
