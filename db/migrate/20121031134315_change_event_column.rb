class ChangeEventColumn < ActiveRecord::Migration
  def up
    change_column :events, :time, :datetime, :default => Time.now
  end

  def down
    remove_column :events, :time
  end
end
