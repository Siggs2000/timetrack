class CreateBillables < ActiveRecord::Migration
  def change
    create_table :billables do |t|
      t.integer :job_id
      t.time :time_in
      t.time :time_out
      t.date :date_in
      t.date :date_out

      t.timestamps
    end
  end
end
