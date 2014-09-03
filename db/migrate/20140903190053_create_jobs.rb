class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :title
      t.text :description
      t.text :duties
      t.date :close

      t.timestamps
    end
  end
end
