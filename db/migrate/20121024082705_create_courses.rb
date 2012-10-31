class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.datetime :date_begin, :default => Time.now

      t.timestamps
    end
  end
end
