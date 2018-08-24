class AddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pass_number, :string
    add_column :users, :family_name, :string
    
    add_column :railway_stations_routes, :arrival,   :datetime
    add_column :railway_stations_routes, :departure, :datetime
  end
end
