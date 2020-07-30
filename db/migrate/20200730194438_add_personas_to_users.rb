class AddPersonasToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :developer, :boolean, default: false
    add_column :users, :employer, :boolean, default: false
  end
end
