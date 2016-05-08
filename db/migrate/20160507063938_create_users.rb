class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :category_id
      t.string :name
      t.string :tel
      t.string :address
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
