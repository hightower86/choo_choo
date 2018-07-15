class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
  add_column :tickets, :user_id, :integer
  end
end
