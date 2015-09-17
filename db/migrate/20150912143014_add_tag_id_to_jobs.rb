class AddTagIdToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :tag, index: true, foreign_key: true
  end
end
