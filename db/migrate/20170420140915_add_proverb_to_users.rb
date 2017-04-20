class AddProverbToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorite_fortune, :string
  end
end
