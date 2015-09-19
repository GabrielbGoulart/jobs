class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.string :reasons
      t.belongs_to :job, index:true

      t.timestamps null: false
    end
  end
end
