class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :job_code
      t.string :name

      t.timestamps
    end
  end
end
