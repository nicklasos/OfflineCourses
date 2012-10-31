class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :time
      t.text :subject
      t.integer :course_id
      t.datetime :time, :default => Time.now

      t.timestamps
    end
  end
end
