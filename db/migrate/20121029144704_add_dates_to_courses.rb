class AddDatesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :date_begin, :datetime, :default => Time.now
    add_column :courses, :date_end, :datetime
  end
end
