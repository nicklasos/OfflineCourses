class AddAdminToSubscribes < ActiveRecord::Migration
  def change
    add_column :subscriptions, :admin, :boolean, :default => false
  end
end
