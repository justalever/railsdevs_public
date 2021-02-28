class AddEmailToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :email, :string
  end
end
