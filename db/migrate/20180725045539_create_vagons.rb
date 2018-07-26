class CreateVagons < ActiveRecord::Migration[5.1]
  def change
    create_table :vagons do |t|
      t.integer :train_id
      t.integer :number
      t.integer :v_type
      t.integer :num_hi_places
      t.integer :num_low_places
      t.timestamps
    end
  end
end
