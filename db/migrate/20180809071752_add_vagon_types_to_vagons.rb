class AddVagonTypesToVagons < ActiveRecord::Migration[5.1]
  def change
    add_column :vagons, :side_low_places, :integer
    add_column :vagons, :side_hi_places,  :integer
    add_column :vagons, :type,            :string
    add_column :vagons, :seat_places,     :integer
  end
end
