class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :admin, :default => false
      t.timestamps
    end
  end
end
