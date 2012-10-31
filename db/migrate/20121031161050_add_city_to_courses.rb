class AddCityToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :city, :string
  end
end
