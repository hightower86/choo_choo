class AddSortFlagToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sort_flag, :boolean
  end
end
