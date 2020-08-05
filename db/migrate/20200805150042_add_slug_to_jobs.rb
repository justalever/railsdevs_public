class AddSlugToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :slug, :string
    add_index :jobs, :slug, unique: true
  end
end
