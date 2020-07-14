class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :password, :hashed_password
    add_column :users, :salt, :string
  end
end
