class AddAttributesToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :pass, :string
    add_column :tickets, :fio, :string
  end
end
