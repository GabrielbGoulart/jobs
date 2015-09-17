class AddValueToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :value, :double
  end
end
